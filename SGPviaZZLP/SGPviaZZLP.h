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
#include <ranges>

using namespace std;

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
	// System variable index into a colIndices array; use ordered map here for determinism
};


/// Solves the Smallest Grammar Problem (SGP) for a given input string via
/// integer linear programming over ZZ (the integers).  The template parameter
/// Symbol must be an integral type whose values partition into a string
/// alphabet (the symbols that appear in the raw input) and a variable alphabet
/// (fresh symbols allocated by the solver).  Referred to as G in comments.
template <IntegralSymbol Symbol>
struct SGPviaZZLP
{
	
	SGPviaZZLP(const vector<Symbol>& uncompressedString)
		: m_uncompressedString(uncompressedString)
	{ }

	list<StraightLineGrammar<Symbol>> computeSmallestGrammars();  ///< Returns all smallest grammars for the input string.

private:
	/// Based on elementary argument that a singleton alphabet grammar can 
	/// be formed that roughly doubles the rhs for "each rule" +/- a terminal. letter.
	size_t numRulesUpperBound() const {
		auto& G = m_grammar;
		auto S = G.startSymbol();
		return (size_t)log2(G[S].size());
	}

	/// Returning simply 1 implies the string isn't compressible at all, 
	/// so return 2.
	size_t numRulesLowerBound() const {
		
		return 2; 
	}

	Symbol takeNextFreeVariableSymbol();  ///< Allocates the next variable symbol not in either alphabet.

	void addSystemVariablesForSymbol(Symbol symbol);

	static vector<vector<Symbol>> kSubsetListsOfSymbols(const vector<Symbol>& symbols, size_t k);

	static map<vector<Symbol>, vector<size_t>>
		substringLocations(const vector<Symbol>& str, size_t maxLength = 0);  ///< Maps each distinct substring to its occurrence positions.

	static unordered_map<Symbol, vector<Symbol>>
		StraightLineGrammar<Symbol>::repeatingSubstringRules(
			const map<vector<Symbol>, vector<size_t>>& substringLocs);  ///< Adds a production rule for each non-overlapping repeated substring.

private:
	const vector<Symbol>& m_uncompressedString;
	set<Symbol> m_stringAlphabet;
	set<Symbol> m_variableAlphabet;
	map<vector<Symbol>, vector<size_t>> m_substringLocs;
	unordered_map<Symbol, vector<Symbol>> m_possibleExpandedRules;
	Symbol m_startSymbol;

	//map<vector<Symbol>, Symbol> m_productionRulesInverseMap;	
	// Excludes s -> S  // TODO; use if needed
};


/// TODO: description
template<IntegralSymbol Symbol>
inline void SGPviaZZLP<Symbol>::addSystemVariablesForSymbol(Symbol symbol)
{ 

}

/// Stores the input string and initialises the single seed production rule
/// S -> s, where S is the first allocated variable and s is the full
/// uncompressed string.
template<IntegralSymbol Symbol>
inline SGPviaZZLP<Symbol>::SGPviaZZLP(const vector<Symbol>& uncompressedString)
{
	m_uncompressedString = uncompressedString;
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


/// Returns a map from every distinct substring of the start-rule RHS to the
/// sorted list of start positions at which it occurs.  If maxLength is 0
/// (the default) all substring lengths up to |s| are considered; otherwise
/// only lengths 1..maxLength are enumerated.
template<IntegralSymbol Symbol>
inline map<vector<Symbol>, vector<size_t>>
SGPviaZZLP<Symbol>::substringLocations(const vector<Symbol>& str, size_t maxLength)
{
	auto& G = *this;
	auto& s = str;

	if (maxLength == 0)
		maxLength = s.size();

	map<vector<Symbol>, vector<size_t>> substringLocs;

	substringLocs[1].reserve(s.size());

	for (size_t i = 0; i < s.size(); i++)
	{
		for (size_t length = 1; length < std::min(maxLength, s.size() - i);
			length++)
		{
			// TODO: ask Claude how to use a 'string view' here to optimize performance
			auto t = vector<Symbol>(s.begin() + i, s.begin() + i + length);

			if (!substringLocs.contains(t))
			{
				substringLocs.insert(t, vector<size_t>{i});
			}
			else {
				substringLocs[t].push_back(i);
			}
		}
	}

	return substringLocs;
}


/// For each substring that occurs at two or more non-overlapping positions,
/// allocates a fresh variable and adds a production rule mapping that variable
/// to the substring.  These candidate rules seed the ILP.
template<IntegralSymbol Symbol>
inline unordered_map<Symbol, vector<Symbol>>
SGPviaZZLP<Symbol>::repeatingSubstringRules(
	const map<vector<Symbol>, vector<size_t>>& substringLocs)
{
	pair<unordered_map<Symbol, vector<Symbol>>, unordered_map<size_t, unordered_set<Symbol>>>
		auto repSubstrCoverage;

	repSubstrCoverage[1].resize(uncompressedLength);

	// TODO: would it be more optimal to use |s| = 2 => 3 or more disjoint copies needed,
	// |s| >=3 => 2 more more disjoint copies needed?

	for (const auto& [substr, locations] : substringLocs)
	{
		if (substr.size() >= 2)
		{
			auto loc0 = locations[0];

			for (size_t loc : locations)
			{
				if (loc >= loc0 + substr.size())
				{
					auto A = takeNextFreeVariableSymbol();
					repSubstrCoverage[0][A] = substr;

					break;
				}
			}
		}
	}
}

/// Allocates and returns the next symbol not already in either alphabet,
/// choosing the smallest non-negative integer that avoids collisions with the
/// string alphabet.  The new symbol is inserted into m_variableAlphabet.
template<IntegralSymbol Symbol>
inline Symbol SGPviaZZLP<Symbol>::takeNextFreeVariableSymbol()
{
	Symbol A;

	if (m_variableAlphabet.size() == 0)
		A = 0;
	else {
		A = *m_variableAlphabet.rbegin();
		A++;
	}

	while (m_stringAlphabet.contains(A))
		A++;

	m_variableAlphabet.insert(A);

	return A;
}

//template<IntegralSymbol Symbol>
//inline bool SGPviaZZLP<Symbol>::isReducible(
//	const map<vector<Symbol>, vector<size_t>>& substringLocs, )
//{
//	StraightLineGrammar G;
//
//	G.initRulesWithRepeatingSubstrings(substringLocs);
//
//	if (G.numGrammarRules() == 0)
//		return false;
//
//	return true;
//}

//template<IntegralSymbol Symbol>
//vector<Symbol> SGPviaZZLP<Symbol>::nonStartRuleSymbols() const
//{
//	std::vector<Key> symbols;
//	symbols.resize(map.size() - 1);
//	size_t k = 0;
//
//	for (const auto& [sym, _] : )
//	{
//		if (sym != m_startSymbol)
//			symbols[k] = sym;
//
//		k++;
//	}
//
//	return symbols;
//}


/// Returns every smallest straight-line grammar that generates the input
/// string up to some standardization equivalences.  Multiple grammars are returned when 
/// there are ties in grammar size under the ILP objective, and there typically are ties.
/// See for example:
/// s = a^6, you have both {S->AA; A->aaa} vs {S->BBB; B->aa} each of size 5.
/// 
template<IntegralSymbol Symbol>
inline list<StraightLineGrammar<Symbol>> SGPviaZZLP<Symbol>::computeSmallestGrammars()
{
	const auto& s = m_uncompressedString;
	const Symbol S = m_startSymbol = takeNextFreeVariableSymbol();		// Start symbol
	list<StraightLineGrammar> optimalGrammars;

	// Build the terminal alphabet
	for (auto sym : s)
	{
		if (! m_stringAlphabet.constains(sym))
			m_stringAlphabet.insert(sym);
	}

	//vector<Symbol> symbols = vector<Symbol>(m_stringAlphabet.begin(), m_stringAlphabet.end())
	//	+ vector<Symbol>(m_variableAlphabet.begin(), m_variableAlphabet.end());
	// Assumes string symbol < variable symbol lexicographically;  since both alphabets
	// are `set`, they come already sorted lexicographically.

	// First compute all "repeating substrings of length >= 2" and place them into our workspace grammar
	size_t maxLength = s.size() >> 1;	// Clearly use size / 2 as max repeatable substring length
	auto& L = m_substringLocs = StraightLineGrammar::substringLocations(s, maxLength);
	auto& R = m_possibleExpandedRules = repeatingSubstringRules(L);

	if (R.size() == 0)	// Short-circuit optimization
	{
		StraightLineGrammar G;
		G[S] = s;
		optimalGrammars.insert(G);
		return optimalGrammars;		// There is no way to compress using a smaller straight-line grammar
	}

	auto a = numRulesLowerBound();
	auto b = std::min(numRulesUpperBound(), R.size());		// Take minimum, because |R| could be less actually

	auto nonStartVariables = m_productionRules | std::views::keys | std::ranges::to<std::vector>();
	
	// TODO: try replacing with some kind of binary search in the interval [a,b]
	for (size_t k = a; k <= b; k++)
	{
		// Gather all non-starting rule symbols:		
		auto kSubsetsOfVars = kSubsetListsOfSymbols(nonStartVariables, k);

		// Keep track of purely terminal T-> t rule sizes, where t is not reducible.
		size_t constantCostSum = 0;

		// In-place construct each test grammar
		for (const auto& varSet : kSubsetsOfVars)
		{
			// Add in variables for substring covers of containerSym = S always
			addSystemVariablesForSymbol(S);

			for (Symbol A : varSet)
			{


				//auto substringLocs1 = substringLocations(G[A], maxLength);

				//if (!isReducible(substringLocs1))
				//{
				//	constantCostSum += m_possibleExpandedRules[A].size();
				//}
				//else {
				//	// Add in variables for substring covers of containerSym = A
				//	addSystemVariablesForSymbol(A);
				//}
			}
		}
	}
}