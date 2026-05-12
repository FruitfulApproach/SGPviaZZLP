#pragma once

#include <unordered_map>
#include <map>
#include <vector>
#include <set>
#include <type_traits>
#include <concepts>

using namespace std;

template<typename Symbol>
concept IntegralSymbol = std::is_integral_v<Symbol>;

template<IntegralSymbol Symbol>
using GrammarString = vector<Symbol>;

template<IntegralSymbol Symbol>
class StraightLineGrammar
{
public:
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

	size_t size() const {  ///< Sum of string lengths of all RHS sides of production rules, is the standard size in the literature.
		size_t sz = 0;
		for (const auto& [_, rhs] : m_productionRules)
			sz += rhs.size();
		return sz;
	}

	size_t ruleCount() const { return m_productionRules.size(); }

private:
	unordered_map<Symbol, GrammarString> m_productionRules;
	Symbol m_startSymbol;
};



