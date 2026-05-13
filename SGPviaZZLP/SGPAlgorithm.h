#pragma once

#include <vector>
#include <list>
#include <ranges>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include "StraightLineGrammar.h"

/// Smallest grammar problem (SGP) algorithm base class.  Symbol = int, int64_t, char, etc.  It's up to the calling code to forward/reverse map
/// the symbols to unicode or ascii if they plan to use it for text.  This generality is to allow for *any* types of symbolic data, not just text.
template<IntegralSymbol Symbol>
class SGPAlgorithm
{
public:
	SGPAlgorithm(const GrammarString& algorithmInput) : s(algorithmInput) {}
	/// The main method, implementation-dependent return value meaning. For example, one subclass implementation might return every possible smallest grammar, 
	/// while another subclass returns just one such, or even an approximation.
	virtual list<StraightLineGrammar<Symbol>> computeSmallestGrammars() = 0;		

	// Subclass helper methods, that can be overriden depending on the subclass's algorithm:
	virtual size_t maximumRuleCount() const;		///< Maximum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual size_t minimumRuleCount() const;		///< Minimum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual Symbol takeNextFreeVariable();			///< Find next unused variable symbol, and register it in the varAlpha.
	virtual vector<vector<Symbol>> kSubsetsOfSymbols(size_t k, const vector<Symbol>& symbols);		///< k-sized subsets of set of symbols represented as vector
	virtual map<String, vector<size_t>> substringIndices(const String& str, size_t maxLen = 0);		///< Indexes within s of substrings of size <= maxLen, or |s| if maxLen = 0
	virtual unordered_map<Symbol, GrammarString> substringRules();		//< The set of possible (and fully expanded) rules R to r that could occur in some smallest grammar for s

protected:
	Symbol S;						// The start symbol of the grammar, or fully expanded that would be S -> s 
	const GrammarString& s;			// The uncompressed algorithm input string, stored by reference (to handle large strings efficiently)
	set<Symbol> strAlpha;			// Alphabet of all chars seen occuring in s
	set<Symbol> varAlpha;			// Alphabet of rule variable symbols (the lhs of a production rule)
};

