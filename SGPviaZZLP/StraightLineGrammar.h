#pragma once

#include <unordered_map>
#include <map>
#include <vector>
#include <set>

using namespace std;

template<typename Symbol>
concept IntegralSymbol = std::is_integral_v<Symbol>;

template<IntegralSymbol Symbol>
struct StraightLineGrammar
{
	StraightLineGrammar() {}

	StraightLineGrammar(const vector<Symbol>& uncompressedString);

	/// Copy ctor
	StraightLineGrammar(const StraightLineGrammar& src)
		: m_productionRules(src.m_productionRules), m_startRule(src.m_startRule),
		m_variableAlphabet(src.m_variableAlphabet), m_stringAlphabet(src.m_stringAlphabet)
	{
	}

	vector<Symbol>& operator[](Symbol var)
	{
		return m_productionRules[var];
	}

	void setStartSymbol(Symbol S) { m_startSymbol = S; }
	Symbol startSymbol() const { return m_startSymbol;  }

	const vector<Symbol>& operator[](Symbol var) const
	{
		return m_productionRules.at(var);
	}

	size_t standardSize() const {  ///< Sum of string lengths of all RHS sides of production rules, is the standard size in the literature.
		size_t sz = 0;
		for (const auto& [_, rhs] : m_productionRules)
			sz += rhs.size();
		return sz;
	}

	size_t compressionSize() const {  ///< Clearly some grammars could potentially have smaller data compression size, but be equal in standard size
		return -1;
		// TODO
	}

	size_t numGrammarRules() const { return m_productionRules.size(); }

	vector<Symbol> nonStartRuleSymbols() const {
		std::vector<Key> symbols;
		symbols.reserve(map.size()-1);
		size_t k = 0;

		for (const auto& [sym, _] : map)
		{
			if (sym != m_startSymbol)
				symbols[k] = sym;

			k++;
		}

		return symbols;
	}

	static map<vector<Symbol>, vector<size_t>>
		computeSubstringLocations(const vector<Symbol>& str, size_t maxLength=0);  ///< Maps each distinct substring to its occurrence positions.

	void initRulesWithRepeatingSubstrings(const
		map<vector<Symbol>, vector<size_t>>& substringLocs);  ///< Adds a production rule for each non-overlapping repeated substring.

	Symbol takeNextFreeVariableSymbol();  ///< Allocates the next variable symbol not in either alphabet.


	bool isReducibleReady(size_t maxLength, const map<vector<Symbol>, vector<size_t>>* substringLocs = nullptr) const;

private:
	unordered_map<Symbol, vector<Symbol>> m_productionRules;
	Symbol m_startSymbol;
	set<Symbol> m_stringAlphabet;
	set<Symbol> m_variableAlphabet;
};


template<IntegralSymbol Symbol>
inline StraightLineGrammar<Symbol>::StraightLineGrammar(const vector<Symbol>& uncompressedString)
{
	auto& s = uncompressedString;

	for (Symbol sym : s)
	{
		if (!m_stringAlphabet.contains(sym))
			m_stringAlphabet.insert(sym);
	}

	Symbol S = takeNextFreeVariableSymbol();
	auto& G = *this;

	G[S] = s;
	m_startSymbol = S;
}
/// Returns a map from every distinct substring of the start-rule RHS to the
/// sorted list of start positions at which it occurs.  If maxLength is 0
/// (the default) all substring lengths up to |s| are considered; otherwise
/// only lengths 1..maxLength are enumerated.
template<IntegralSymbol Symbol>
inline map<vector<Symbol>, vector<size_t>>
StraightLineGrammar<Symbol>::computeSubstringLocations(const vector<Symbol>& str, size_t maxLength)
{
	auto& G = *this;
	auto& s = str;

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


/// For each substring that occurs at two or more non-overlapping positions,
/// allocates a fresh variable and adds a production rule mapping that variable
/// to the substring.  These candidate rules seed the ILP.
template<IntegralSymbol Symbol>
inline void StraightLineGrammar<Symbol>::initRulesWithRepeatingSubstrings(
	const map<vector<Symbol>, vector<size_t>>& substringLocs)
{
	auto& G = *this;
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
					G[A] = substr;
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
inline Symbol StraightLineGrammar<Symbol>::takeNextFreeVariableSymbol()
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

template<IntegralSymbol Symbol>
inline bool StraightLineGrammar<Symbol>::isReducibleReady(size_t maxLength, const map<vector<Symbol>, vector<size_t>>* substringLocs) const
{
	auto& G = *this;

	if (substringLocs == nullptr)
		substringLocs = computeSubstringLocations(maxLength);

	G.initRulesWithRepeatingSubstrings(substringLocs);

	if (G.numGrammarRules() == 1)
		return false;

	return true;
}
