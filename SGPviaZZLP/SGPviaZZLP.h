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

	size_t variableIndex(Symbol containerSym, Symbol coverSym, size_t maxNumCovers, size_t containerPosIndex, size_t numSystemRules) 
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

private:
	StraightLineGrammar<Symbol> m_grammar;
	//map<vector<Symbol>, Symbol> m_productionRulesInverseMap;	// Excludes s -> S  // TODO; use if needed

	map<Symbol, size_t> m_numSystemColumnsPerSymbol;		// Use ordered map here for determinism
};


/// Stores a set of 0-1 ILP variables as parallel arrays.
/// colIndices holds the HiGHS column index for each variable;
/// values is bit-packed (std::vector<bool> specialisation) at 1 bit per variable.
struct ZeroOneILPVariables
{
	std::vector<HighsInt> colIndices;
	std::vector<bool>     values;

	/// Registers a new binary variable with HiGHS and records its column index.
	void add(Highs& h, double cost = 0.0)
	{
		HighsInt col = h.getNumCol();
		h.addVar(0.0, 1.0);
		h.changeColCostByRange(col, col, &cost);
		h.changeColIntegrality(col, HighsVarType::kInteger);
		colIndices.push_back(col);
		values.push_back(false);
	}

	/// Populates values from the HiGHS solution after h.run().
	/// Rounds to nearest integer to absorb floating-point noise.
	void readSolution(const Highs& h)
	{
		const std::vector<double>& sol = h.getSolution().col_value;
		for (size_t i = 0; i < colIndices.size(); i++)
			values[i] = sol[colIndices[i]] > 0.5;
	}

	bool   isSet(size_t i) const { return values[i]; }
	size_t size()          const { return colIndices.size(); }
};


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
	auto& G = m_grammar;
	list<StraightLineGrammar> optimalGrammars;

	vector<Symbol> symbols = vector<Symbol>(m_stringAlphabet.begin(), m_stringAlphabet.end())
		+ vector<Symbol>(m_variableAlphabet.begin(), m_variableAlphabet.end());
	// Assumes string symbol < variable symbol lexicographically;  since both alphabets
	// are `set`, they come already sorted lexicographically.

	auto S = G.startSymbol();

	// First compute all "repeating substrings of length >= 2" and place them into our workspace grammar
	size_t maxLength = G[S].size() >> 1;	// Clearly use size / 2 as max repeatable substring length
	auto substringLocs = StraightLineGrammar::computeSubstringLocations(G[S], maxLength);
	initRulesWithRepeatingSubstrings(substringLocs);

	if (g.numGramamrRules() == 1)	// Short-circuit optimization
	{
		optimalGrammars.insert(G);
		return optimalGrammars;		// There is no way to compress using a smaller straight-line grammar
	}

	auto a = numRulesLowerBound();
	auto b = numRulesUpperBound();

	size_t c = (a + b) >> 1;	// Take midpoint in a binary-search-like way

	// Gather all non-starting rule symbols:
	auto nonStartVariables = G.nonStartVariableSymbols(c);
	auto cSubsetsOfVars = kSubsetListsOfSymbols(nonStartVariables, c);
	auto S = G.startSymbol();

	unordered_map<Symbol, vector<Symbol>*> grammarRulePtrs;		// Here we use pointers, as strings can become HUGE in practice

	grammarRulePtrs[S] = &G[S];			//  Always include this rule of course
	m_numSystemColumnsPerSymbol[S] = c * ;

	// In-place construct each test grammar
	for (const auto& varSet : cSubsetsOfVars)
	{
		for (Symbol A : varSet)
		{
			grammarRulePtrs[A] = &G[A];
			auto substringLocs1 = StraightLineGrammar::computeSubstringLocations(G[A], maxLength);
			m_numSystemColumnsPerSymbol[A] = substringLocs
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
