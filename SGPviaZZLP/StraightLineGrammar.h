#pragma once

#include <unordered_map>

using namespace std;

template<typename Symbol>
concept IntegralSymbol = std::is_integral_v<Symbol>;

template<IntegralSymbol Symbol>
struct StraightLineGrammar
{
	StraightLineGrammar() {}

	vector<Symbol>& operator [] (Symbol var, const vector<Symbol>& rhs)
	{
		return m_productionRules[var] = rhs;
	}

	vector<Symbol>& operator [] (Symbol var) const
	{
		return m_productionRules[var];
	}

private:
	unordered_map<Symbol, vector<Symbol>> m_productionRules;
};

