#pragma once

#include <vector>
#include <map>
#include <unordered_map>
#include <set>  // Using set instead of unordered_set, for the O(1) (vs O(n)) max element taking.
#include <unordered_set>
#include <type_traits>
#include <concepts>
#include <list>
#include "StraightLineGrammar.h"
#include <Highs.h>

using namespace std;
struct ZeroOneILPVariables;

/// Solves the Smallest Grammar Problem (SGP) for a given input string via
/// integer linear programming over ZZ (the integers).  The template parameter
/// Symbol must be an integral type whose values partition into a string
/// alphabet (the symbols that appear in the raw input) and a variable alphabet
/// (fresh symbols allocated by the solver).  Referred to as G in comments.
template <IntegralSymbol Symbol>
struct SGPviaZZLP
{
	SGPviaZZLP(const vector<Symbol>& uncompressedString);  ///< Seeds the grammar with the single rule S -> s.

	list<StraightLineGrammar<Symbol>> computeSmallestGrammars();  ///< Returns all smallest grammars for the input string.

private:

	size_t variableIndex(
	{
		auto& G = m_grammar;
		auto S = G.startSymbol();
		sym -= S;	// Translate everything down to zero based, since (string) alphabet symbols occupy the first indices
		algoChoiceSym -= S;

	}

	size_t numRulesUpperBound() const {
		auto& G = m_grammar;
		auto S = G.startSymbol();
		return (size_t)log2(G[S].size());
	}

	size_t numRulesLowerBound() const {
		// Returning simply 1 implies the grammar starting string isn't compressible at all, so return 2.
		return 2; // TODO: see responses to:
		// https://cstheory.stackexchange.com/questions/57119/what-are-the-theoretic-upper-lower-bounds-on-the-sizes-of-the-exact-smallest
	}

	vector<vector<Symbol>> kSubsetListsOfSymbols(const vector<Symbol>& symbols, size_t k);

	void addSystemVariablesForSymbol(Symbol symbol);

private:
	StraightLineGrammar<Symbol> m_grammar;	
	map<vector<Symbol>, vector<size_t>> m_substringLocs;
	// TODO: refactor this structure throughout to be 
	// pair<unordered_map<Symbol, vector<size_t>>, map<vector<Symbol>, Symbol>> (?)

	//map<vector<Symbol>, Symbol> m_productionRulesInverseMap;	
	// Excludes s -> S  // TODO; use if needed
};


/// Stores a set of 0-1 ILP variables as parallel arrays.
/// colIndices holds the HiGHS column index for each variable;
/// values is bit-packed (std::vector<bool> specialisation) at 1 bit per variable.
template<IntegralSymbol Symbol>
struct ZeroOneILPVariables
{
	/// Registers a new binary variable with HiGHS and records its column index.
	void addColumn(Symbol containerSym, size_t containerPos, Symbol coverSym, 
		Highs& h, double cost = 0.0)
	{
		HighsInt col = h.getNumCol();
		h.addVar(0.0, 1.0);
		h.changeColCostByRange(col, col, &cost);
		h.changeColIntegrality(col, HighsVarType::kInteger);

		if (!m_multiIndexer.contains(containerSym))
			m_multiIndexer[containerSym] = vector<map<Symbol, size_t>>{};

		if (!m_multiIndexer[containerSym].contains(containerPos))
			m_multiIndexer[containerSym][containerPos] = map<Symbol, size_t>{};

		if (!m_multiIndexer[containerSym][containerPos].contains(coverSym))
		{
			m_multiIndexer[containerSym][containerPos][coverSym] = m_colIndices.size();
			m_colIndices.push_back(col);
			m_values.push_back(false);
		}
		else
			// TODO: ask Claude what exception to use, possibly with more data (formatted)
			throw std::exception("HiGHS column index doubly added to ZeroOneILPVariables struct.");
	}

	/// Populates values from the HiGHS solution after h.run().
	/// Rounds to nearest integer to absorb floating-point noise.
	void readSolution(const Highs& h)
	{
		const std::vector<double>& sol = h.getSolution().col_value;
		for (size_t i = 0; i < m_colIndices.size(); i++)
			m_values[i] = sol[m_colIndices[i]] > 0.5;
	}

	bool   isSet(size_t i) const { return m_values[i]; }
	size_t size()          const { return m_colIndices.size(); }

	void clear() { m_colIndices.clear(); m_values.clear(); m_multiIndexer.clear(); }

	HighsInt columnIndex(Symbol containerSym, size_t containerPos, Symbol coverSym)
	{
		return m_colIndices[m_multiIndexer[containerSym][containerPos][coverSym]];
	}

	const vector<map<Symbol, size_t>>& operator [] (Symbol containerSym) const
	{
		return m_multiIndexer[containerSym];
	}

private:
	std::vector<HighsInt> m_colIndices;
	std::vector<bool>     m_values;
	map<Symbol, vector<map<Symbol, size_t>>> m_multiIndexer; 
	map<vector<Symbol>, vector<size_t>> m_substringLocs;
	unordered_map<Symbol, vector<Symbol>> m_possibleExpandedRules;

	// System variable index into a colIndices array; use ordered map here for determinism
};

/// TODO: description
template<IntegralSymbol Symbol>
inline void SGPviaZZLP<Symbol>::addSystemVariablesForSymbol(Symbol symbol)
{ 
	auto& rhs = m_grammar[symbol];

	for (size_t i = 0; i < rhs.size(); i++)
	{

	}
}

/// Stores the input string and initialises the single seed production rule
/// S -> s, where S is the first allocated variable and s is the full
/// uncompressed string.
template<IntegralSymbol Symbol>
inline SGPviaZZLP<Symbol>::SGPviaZZLP(
	const vector<Symbol>& uncompressedString)
	: m_grammar(uncompressedString)
{
}


/// Returns every smallest straight-line grammar that generates the input
/// string up to some standardization equivalences.  Multiple grammars are returned when 
/// there are ties in grammar size under the ILP objective, and there typically are ties.
/// See for example:
/// s = a^6, you have both {S->AA; A->aaa} vs {S->BBB; B->aa} each of size 5.
/// 
template<IntegralSymbol Symbol>
inline list<StraightLineGrammar<Symbol>> SGPviaZZLP<Symbol>::computeSmallestGrammars()
{
	list<StraightLineGrammar> optimalGrammars;
	auto& G = m_grammar;	// TODO: refactor into raw map here, since we don't really use any grammar methods
	auto S = G.startSymbol();

	vector<Symbol> symbols = vector<Symbol>(m_stringAlphabet.begin(), m_stringAlphabet.end())
		+ vector<Symbol>(m_variableAlphabet.begin(), m_variableAlphabet.end());
	// Assumes string symbol < variable symbol lexicographically;  since both alphabets
	// are `set`, they come already sorted lexicographically.

	auto S = G.startSymbol();

	// First compute all "repeating substrings of length >= 2" and place them into our workspace grammar
	size_t maxLength = G[S].size() >> 1;	// Clearly use size / 2 as max repeatable substring length
	m_substringLocs = StraightLineGrammar::computeSubstringLocations(G[S], maxLength);
	m_possibleExpandedRules = repeatingSubstringRules(m_substringLocs);

	if (g.numGramamrRules() == 1)	// Short-circuit optimization
	{
		optimalGrammars.insert(G);
		return optimalGrammars;		// There is no way to compress using a smaller straight-line grammar
	}

	auto a = numRulesLowerBound();
	auto b = numRulesUpperBound();
	auto nonStartVariables = G.nonStartVariableSymbols();

	for (size_t c = a; c <= b; c++) 
	{
		// Gather all non-starting rule symbols:		
		auto cSubsetsOfVars = kSubsetListsOfSymbols(nonStartVariables, c);

		// Keep track of purely terminal T-> t rule sizes, where t is not reducible.
		size_t constantCostSum = 0;

		// In-place construct each test grammar
		for (const auto& varSet : cSubsetsOfVars)
		{
			// Add in variables for substring covers of containerSym = S always
			addSystemVariablesForSymbol(S);

			for (Symbol A : varSet)
			{
				auto substringLocs1 = StraightLineGrammar::computeSubstringLocations(G[A], maxLength);
				
				if (! StraightLineGrammar::isReducible(substringLocs1))
				{
					constantCostSum += G[A].size();
				}
				else {
					// Add in variables for substring covers of containerSym = A
					addSystemVariablesForSymbol(A);
				}
			}
		}
	}
}


template<IntegralSymbol Symbol>
inline vector<vector<Symbol>> SGPviaZZLP<Symbol>::kSubsetListsOfSymbols(const vector<Symbol>& symbols, size_t k)
{
	vector<vector<Symbol>> result;

	do {
		vector<Symbol> subset;
		subset.reserve(k);
		size_t j = 0;

		for (size_t i = 0; i < v.size(); i++)
		{
			if (selector[i]) {
				subset[j] = v[i];
				j++;
			}
		}
	} 
	while (next_permutation(selector.begin(), selector.end()));
	return result;
}
