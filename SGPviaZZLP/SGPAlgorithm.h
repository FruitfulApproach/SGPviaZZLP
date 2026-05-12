#pragma once

#include <vector>
#include <list>
#include <ranges>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include "StraightLineGrammar.h"

template<IntegralSymbol Symbol>
class SGPAlgorithm
{
public:
	SGPAlgorithm(const String& s) : s(s) {}
	virtual list<StraightLineGrammar<Symbol>> computeSmallestGrammars() = 0;	///< The main method, implementation-dependent return value meaning.
	virtual size_t maximumRuleCount() const;		///< Maximum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual size_t minimumRuleCount() const;		///< Minimum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual Symbol takeNextFreeVarSymbol();			///< Find next unused variable symbol, and register it in the varAlpha.
	
	static vector<vector<Symbol>> kSubsetsOfSymbols(size_t k, const vector<Symbol>& symbols);
	static map<String, vector<size_t>> substrIndices(const String& str, size_t maxLen = 0);
	static 

protected:
	Symbol S;
	const GrammarString& s;
	set<Symbol> strAlpha;
	set<Symbol> varAlpha;
};

