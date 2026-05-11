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

	/// Copy ctor
	StraightLineGrammar(const StraightLineGrammar& src)
		: m_productionRules(src.m_productionRules), m_startRule(src.m_startRule),
	{
	}

	vector<Symbol>& operator[](Symbol var)
	{
		return m_productionRules[var];
	}

	const vector<Symbol>& operator[](Symbol var) const
	{
		return m_productionRules.at(var);
	}

	void setStartSymbol(Symbol S) { m_startSymbol = S; }
	Symbol startSymbol() const { return m_startSymbol; }

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



private:
	unordered_map<Symbol, vector<Symbol>> m_productionRules;
	Symbol m_startSymbol;
};



