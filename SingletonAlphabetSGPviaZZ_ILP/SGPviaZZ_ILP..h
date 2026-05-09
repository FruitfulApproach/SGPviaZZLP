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

using namespace std;

template<typename Symbol>
concept IntegralSymbol = std::is_integral_v<Symbol>;

template <IntegralSymbol Symbol>
struct SGPviaZZ_ILP		// G throughout comments
{
	SGPviaZZ_ILP(const vector<Symbol>& uncompressedString);

	// -1 => compute all substrings of length 1...|s|
	// Value is map A -> left-to-right ordered lists of locs within G[A] the rhs
	
	list<StraightLineGrammar<Symbol>> computeSmallestGrammars();

private:
	map<vector<Symbol>, vector<size_t>>
		computeSubstringLocations(size_t maxLength=0);

	void initRulesWithRepeatingSubstrings(const 
		map<vector<Symbol>, vector<size_t>>& substringLocs);

	Symbol takeNextFreeVariableSymbol();

private:
	unordered_map<Symbol, vector<Symbol>> m_productionRules;
	map<vector<Symbol>, Symbol> m_productionRulesInverseMap;	// Excludes s -> S
	set<Symbol> m_stringAlphabet;
	set<Symbol> m_variableAlphabet;
	Symbol m_startSymbol;
};

template<IntegralSymbol Symbol>
inline SGPviaZZ_ILP<Symbol>::SGPviaZZ_ILP(
	const vector<Symbol>& uncompressedString)
	: m_uncompressedString(uncompressedString)
{
	auto& s = uncompressedString;

	for (Symbol sym : uncompressedString)
	{
		if (! m_stringAlphabet.contains(sym))
			m_stringAlphabet.insert(sym);
	}
	
	Symbol S = takeNextFreeVariableSymbol();
	m_productionRules[S] = s;
	m_startSymbol = S;
}


template<IntegralSymbol Symbol>
inline list<StraightLineGrammar<Symbol>> SGPviaZZ_ILP<Symbol>::computeSmallestGrammars()
{
	list<StraightLineGrammar> optimalGrammars;

	vector<Symbol> symbols = vector<Symbol>(m_stringAlphabet.begin(), m_stringAlphabet.end())
		+ vector<Symbol>(m_variableAlphabet.begin(), m_variableAlphabet.end());
	// Assumes string symbol < variable symbol lexicographically;  since both alphabets
	// are `set`, they come already sorted lexicographically.


}

template<IntegralSymbol Symbol>
inline map<vector<Symbol>, vector<size_t>>
	SGPviaZZ_ILP<Symbol>::computeSubstringLocations(size_t maxLength)
{
	Symbol& S = m_startSymbol;
	vector<Symbol>& s = m_productionRules[S];
	auto& G = m_productionRules;

	if (maxLength == 0)
		maxLength = s.size();

	map<vector<Symbol>, vector<size_t>> substringLocs;
	
	for (size_t i = 0; i < s.size(); i++)
	{
		for (size_t length = 1; length < std::min(maxLength, s.size() - i);
			length++)
		{
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

template<IntegralSymbol Symbol>
inline void SGPviaZZ_ILP<Symbol>::initRulesWithRepeatingSubstrings(
	const map<vector<Symbol>, vector<size_t>>& substringLocs)
{
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
					m_productionRules[A] = substr;
					break;
				}
			}
		}
	}
}

template<IntegralSymbol Symbol>
inline Symbol SGPviaZZ_ILP<Symbol>::takeNextFreeVariableSymbol()
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
