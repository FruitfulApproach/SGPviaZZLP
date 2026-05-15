#pragma once

#include "SGPAlgorithm.h"
#include <Highs.h>
#include <stdexcept>
#include <format>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <cmr/tu.h>
#include <cmr/matrix.h>

template<IntegralSymbol Symbol>
class ZeroOneILPAlgorithm : public SGPAlgorithm<Symbol>
{
public:
	list<StraightLineGrammar<Symbol>> computeSmallestGrammars() override;

	/// If true, run CMR's TU recognition on each constraint matrix; relax integrality
	/// to solve as an LP when the matrix is TU (simplex returns an integer optimum on a
	/// TU + integer-data LP, avoiding branch-and-bound). If false, always use HiGHS's MIP path.
	bool getDoTUCheck() const         { return doTUCheck; }
	void setDoTUCheck(bool v)         { doTUCheck = v; }

	/// Max number of columns for which the constraint matrix is dumped to stdout in
	/// NDEBUG builds when doTUCheck is enabled. Larger matrices skip the dump.
	size_t getDbgPrintMaxMatrixSize() const  { return dbgPrintMaxMatrixSize; }
	void   setDbgPrintMaxMatrixSize(size_t v){ dbgPrintMaxMatrixSize = v; }

protected:
	bool   doTUCheck             = false;	// off by default — TU recognition is non-trivial work
	size_t dbgPrintMaxMatrixSize = 128;		// matrices with <= 128 columns get pretty-printed

    vector<HighsInt> columnInd;     // system column index -> HiGHs library matrix column index
    vector<bool> solution;          // 01 solution values
    map<Symbol, map<size_t, map<Symbol, size_t>>> mapToCol;      // container, index, cover -> columnInd
    map<GrammarString, vector<size_t>> C;       // "compressibles", but here actually reducibles witin s (includes all 'ab' with s=..(ab)t(ab).. for example)
    unordered_map<Symbol, GrammarString> R;     // rules

	/// Run CMR's TU recognizer on the current constraint matrix of h.
	/// Returns true iff every square submatrix has determinant in {-1, 0, +1}.
	/// Entries outside {-1, 0, +1} short-circuit to false.
	bool isSystemMatrixTU(const Highs& h) const;

	/// Pretty-print the constraint matrix of h to stdout. Dense form; '.' for zeros.
	void debugPrintSystemMatrix(const Highs& h) const;

    /// Registers a new binary variable with HiGHS and records its column index.
    void addSystemColumn(Symbol containerSym, size_t containerPos, Symbol coverSym, Highs& h, double cost = 0.0);

	/// Populates values from the HiGHS solution after h.run().
	/// Rounds to nearest integer to absorb floating-point noise.
	void readSystemSolution(const Highs& h);

	// Check if a 0-1 variable is set in the solution, by index into the columnInd array.
	bool   isSystemVariableSet(size_t i) const { return solution[i]; }

	// Get the number of variables currently registered.
	size_t systemMatrixSize()          const { return columnInd.size(); }

	/// Clear the whole system in case we have to compute many possible smallest grammars.
	void clearSystemColumns() { columnInd.clearSystemColumns(); solution.clearSystemColumns(); mapToCol.clearSystemColumns(); }

	/// Get the HiGHS column index for the variable corresponding to the given 
	/// container symbol, position, and cover symbol.
	HighsInt systemColumnIndex(Symbol containerSym, size_t containerPos, Symbol coverSym);

};

template<IntegralSymbol Symbol>
inline list<StraightLineGrammar<Symbol>> ZeroOneILPAlgorithm<Symbol>::computeSmallestGrammars()
{
	list<StraightLineGrammar<Symbol>> results;

	Highs h;
#ifdef NDEBUG
	h.setOptionValue("output_flag", false);					// Release builds: silence the HiGHS solver log.
#endif
	h.changeObjectiveSense(ObjSense::kMinimize);			// Smallest grammar => minimize sum of selected cover-variable costs.

	auto substrInds = substringIndices(s, s.systemMatrixSize() >> 1);		// Max. size for any repeating substring is clearly |s|/2
	auto substrRules = substringRules(substrInds);
	auto startSymbolCovers = substringCovers(s, substrInds, substrRules);

	for (size_t k = minimumRuleCount(); k <= maximumRuleCount(); k++)
	{
		clearSystemColumns();

	// Initialize the HiGHS model with the start rule covers
	for (size_t i = 0; i < startSymbolCovers.systemMatrixSize(); i++)
	{
		for (Symbol coverSym : startSymbolCovers[i])
		{
			addSystemColumn(S, i, coverSym, h, 1.0);
		}
	}

	// Finish initilizing, in order, the HiGHS model with the covers for the rest of the rules
	for (const auto& [A, rhs] : substrRules)
	{
		auto varCovers = substringCovers(rhs, substrInds, substrRules);

		for (size_t i = 0; i < varCovers.systemMatrixSize(); i++)
		{
			for (Symbol coverSym : varCovers[i])
			{
				addSystemColumn(A, i, coverSym, h, 1.0);
			}
		}
	}

	// TU dispatch: if requested and the matrix is TU, relax integrality so HiGHS
	// solves a continuous LP (simplex returns an integer vertex on a TU+integer LP,
	// avoiding branch-and-bound). Otherwise keep columns integer => HiGHS MIP path.
	if (doTUCheck)
	{
		const bool isTU = isSystemMatrixTU(h);

#ifdef NDEBUG
		if (static_cast<size_t>(h.getNumCol()) <= dbgPrintMaxMatrixSize)
			debugPrintSystemMatrix(h);
		std::cout << "System matrix is " << (isTU ? "" : "NOT ")
		          << "totally unimodular ("
		          << h.getNumRow() << " rows x " << h.getNumCol() << " cols).\n";
#endif

		if (isTU)
		{
			const HighsInt nCol = h.getNumCol();
			for (HighsInt c = 0; c < nCol; c++)
				h.changeColIntegrality(c, HighsVarType::kContinuous);
		}
	}

	h.run();

	return results;
}

template<IntegralSymbol Symbol>
inline void ZeroOneILPAlgorithm<Symbol>
	::addSystemColumn(Symbol containerSym, size_t containerPos, Symbol coverSym, Highs& h, double cost)
{
	HighsInt col = h.getNumCol();
	h.addVar(0.0, 1.0);
	h.changeColCostByRange(col, col, &cost);
	h.changeColIntegrality(col, HighsVarType::kInteger);

	// std::map::operator[] default-constructs missing levels, so the two outer
	// containment checks the previous version did are redundant.
	auto& innerMap = mapToCol[containerSym][containerPos];

	if (!innerMap.contains(coverSym))
	{
		innerMap[coverSym] = columnInd.systemMatrixSize();
		columnInd.push_back(col);
		solution.push_back(false);
	}
	else
		throw std::logic_error(std::format(
			"HiGHS column doubly added: containerSym={}, containerPos={}, coverSym={}, existingColIndex={}.",
			containerSym, containerPos, coverSym,
			innerMap[coverSym]));
}

template<IntegralSymbol Symbol>
inline void ZeroOneILPAlgorithm<Symbol>::readSystemSolution(const Highs& h)
{
	const std::vector<double>& sol = h.getSolution().col_value;
	for (size_t i = 0; i < columnInd.systemMatrixSize(); i++)
		solution[i] = sol[columnInd[i]] > 0.5;
}

template<IntegralSymbol Symbol>
inline HighsInt ZeroOneILPAlgorithm<Symbol>::systemColumnIndex(Symbol containerSym, size_t containerPos, Symbol coverSym)
{
	return columnInd[mapToCol[containerSym][containerPos][coverSym]];
}

template<IntegralSymbol Symbol>
inline bool ZeroOneILPAlgorithm<Symbol>::isSystemMatrixTU(const Highs& h) const
{
	const HighsInt nRow = h.getNumRow();
	const HighsInt nCol = h.getNumCol();

	if (nRow == 0 || nCol == 0)
		return true;								// empty matrix is vacuously TU

	const HighsLp& lp = h.getLp();
	const HighsSparseMatrix& A = lp.a_matrix_;

	// Walk HiGHS's sparse storage (column- or row-major) and bucket entries by row,
	// rounding values to signed chars. Any entry outside {-1, 0, +1} disqualifies TU
	// immediately — no need to hand the matrix to CMR.
	std::vector<std::vector<std::pair<HighsInt, signed char>>> rowEntries(nRow);

	auto addEntry = [&](HighsInt r, HighsInt c, double v) -> bool
	{
		const long rounded = std::lround(v);
		if (rounded < -1 || rounded > 1)
			return false;
		if (rounded != 0)
			rowEntries[r].emplace_back(c, static_cast<signed char>(rounded));
		return true;
	};

	if (A.format_ == MatrixFormat::kColwise)
	{
		for (HighsInt c = 0; c < nCol; c++)
			for (HighsInt k = A.start_[c]; k < A.start_[c + 1]; k++)
				if (!addEntry(A.index_[k], c, A.value_[k]))
					return false;
	}
	else
	{
		for (HighsInt r = 0; r < nRow; r++)
			for (HighsInt k = A.start_[r]; k < A.start_[r + 1]; k++)
				if (!addEntry(r, A.index_[k], A.value_[k]))
					return false;
	}

	// CMR expects each row's columns sorted ascending.
	HighsInt totalNz = 0;
	for (auto& row : rowEntries)
	{
		std::sort(row.begin(), row.end());
		totalNz += static_cast<HighsInt>(row.systemMatrixSize());
	}

	// NOTE: CMR API surface has shifted across versions. The calls below target the
	// current discopt/cmr master. If your CMR is older/newer, adjust the function
	// names / argument lists; the semantics (env -> CHRMAT -> tuTest -> free) are stable.
	CMR* cmr = nullptr;
	CMRcreateEnvironment(&cmr);

	CMR_CHRMAT* matrix = nullptr;
	CMRchrmatCreate(cmr, &matrix, static_cast<int>(nRow), static_cast<int>(nCol), static_cast<int>(totalNz));

	int nz = 0;
	for (HighsInt r = 0; r < nRow; r++)
	{
		matrix->rowSlice[r] = nz;
		for (const auto& [c, v] : rowEntries[r])
		{
			matrix->entryColumns[nz] = static_cast<int>(c);
			matrix->entryValues[nz]  = v;
			nz++;
		}
	}
	matrix->rowSlice[nRow] = nz;
	matrix->numNonzeros    = nz;

	bool isTU = false;
	CMRtuTest(cmr, matrix, &isTU, nullptr, nullptr, nullptr, 0.0);

	CMRchrmatFree(cmr, &matrix);
	CMRfreeEnvironment(&cmr);

	return isTU;
}

template<IntegralSymbol Symbol>
inline void ZeroOneILPAlgorithm<Symbol>::debugPrintSystemMatrix(const Highs& h) const
{
	const HighsInt nRow = h.getNumRow();
	const HighsInt nCol = h.getNumCol();

	if (nRow == 0 || nCol == 0)
	{
		std::cout << "System matrix is empty (" << nRow << " x " << nCol << ").\n";
		return;
	}

	const HighsLp& lp = h.getLp();
	const HighsSparseMatrix& A = lp.a_matrix_;

	// Densify locally for printing. Cheap because dbgPrintMaxMatrixSize caps nCol.
	std::vector<std::vector<double>> dense(nRow, std::vector<double>(nCol, 0.0));
	if (A.format_ == MatrixFormat::kColwise)
	{
		for (HighsInt c = 0; c < nCol; c++)
			for (HighsInt k = A.start_[c]; k < A.start_[c + 1]; k++)
				dense[A.index_[k]][c] = A.value_[k];
	}
	else
	{
		for (HighsInt r = 0; r < nRow; r++)
			for (HighsInt k = A.start_[r]; k < A.start_[r + 1]; k++)
				dense[r][A.index_[k]] = A.value_[k];
	}

	std::cout << "System matrix (" << nRow << " x " << nCol << "):\n";
	for (HighsInt r = 0; r < nRow; r++)
	{
		for (HighsInt c = 0; c < nCol; c++)
		{
			if (dense[r][c] == 0.0)
				std::cout << "    .";
			else
				std::cout << std::format(" {:>4g}", dense[r][c]);
		}
		std::cout << '\n';
	}
	std::cout.flush();
}



