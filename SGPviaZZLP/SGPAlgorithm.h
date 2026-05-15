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
protected:
	Symbol S;						// The start symbol of the grammar, or fully expanded that would be S -> s 
	const GrammarString<Symbol>& s;	// The uncompressed algorithm input string, stored by reference (to handle large strings efficiently)
	set<Symbol> strAlpha;			// Alphabet of all chars seen occuring in s
	set<Symbol> varAlpha;			// Alphabet of rule variable symbols (the lhs of a production rule)

public:
	/// Constructor.  algorithmInput is the uncompressed string for which we want to compute the 
	/// smallest grammar.  The constructor stores it by reference, so the caller must ensure it
	/// remains valid for the lifetime of this object.  That is for efficiency reasons for large strings.
	SGPAlgorithm(const GrammarString<Symbol>& algorithmInput);

	/// The main method, implementation-dependent return value meaning. For example, one subclass 
	/// implementation might return every possible smallest grammar, while another subclass returns
	/// just one such, or even an approximation.
	virtual list<StraightLineGrammar<Symbol>> computeSmallestGrammars() = 0;		

	virtual size_t maximumRuleCount() const;	///< Maximum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual size_t minimumRuleCount() const;	///< Minimum rule count amongst any smallest grammar for |s| = n, but could even be for specific s.
	virtual Symbol takeNextFreeVariable();		///< Find next unused variable symbol, and register it in the varAlpha.
	
	/// k-sized subsets of set of symbols represented as vector
	virtual vector<vector<Symbol>> kSubsetsOfSymbols(size_t k, const vector<Symbol>& symbols);		
	
	/// Get all substrings of 1 <= length <= maxLen, and the sorted list of start positions
	/// at which they occur within s. If maxLen is 0, then all substring lengths up to |s| are considered.  
	/// Note that the number of substrings is O(n^2) in the worst case, so this method is expensive for large strings, 
	/// and should be used with care.  For example, for s = a^n, you have n - l + 1 occurrences of each substring 
	/// of length l, and there are n - l + 1 such substrings.
	/// 
	/// Optimization: use "string views" here to avoid materializing a vector copy of the 
	/// substring on every iteration, which is very expensive.  Instead we can just use 
	/// a view into the original string, and the transparent comparator will allow us to 
	/// find it in the map without copying it.   Especially important for large strings, 
	/// where the number of substrings is O(n^2) and we copy typically substrings of length
	/// O(n) in the wrost case.
	virtual map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess> 
		substringIndices(const GrammarString<Symbol>& str, size_t maxLen = 0);		
	
	/// The set of possible (and fully expanded) rules R to r that could occur in some smallest grammar for s
	virtual map<Symbol, GrammarStringView<Symbol>> 
		substringRules(const map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess>& indices);	

	/// Compute substring covers, which are the possible ways to cover s with the rules in R.  
	/// This is a key step in the ILP formulation (EveryexactSmallestGrammar subclass) for computing the smallest grammar, 
	/// and is also useful for other algorithms.  Since we are given a set of possible rules R, we can encode the result
	/// of this function using the strictly the variable symbols in R (its keys), and forget about the (possibly large)
	/// actual substrings for now.
	vector<set<Symbol>> substringSymbolCovers(
		const GrammarStringView<Symbol>& t,
		const map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess>& indices,
		const map<Symbol, GrammarStringView<Symbol>>& rules);
};

template<IntegralSymbol Symbol>
inline SGPAlgorithm<Symbol>::SGPAlgorithm(const GrammarString<Symbol>& algorithmInput)
	: s(algorithmInput)
{
	strAlpha = set<Symbol>(s.begin(), s.end());
	S = takeNextFreeVariable();
}

template<IntegralSymbol Symbol>
inline size_t SGPAlgorithm<Symbol>::maximumRuleCount() const
{
	return (size_t)log2(s.systemMatrixSize());
}

template<IntegralSymbol Symbol>
inline size_t SGPAlgorithm<Symbol>::minimumRuleCount() const
{
	return 2;
}

template<IntegralSymbol Symbol>
inline Symbol SGPAlgorithm<Symbol>::takeNextFreeVariable()
{
	Symbol A;

	if (varAlpha.systemMatrixSize() == 0)
		A = 0;
	else {
		A = *varAlpha.rbegin();
		A++;
	}

	while (strAlpha.contains(A))
		A++;

	varAlpha.insert(A);

	return A;
}

template<IntegralSymbol Symbol>
inline vector<vector<Symbol>> SGPAlgorithm<Symbol>::kSubsetsOfSymbols(size_t k, const vector<Symbol>& symbols)
{
	vector<vector<Symbol>> result;

	do {
		vector<Symbol> subset;
		subset.reserve(k);
		size_t j = 0;

		for (size_t i = 0; i < v.systemMatrixSize(); i++)
		{
			if (selector[i]) {
				subset[j] = v[i];
				j++;
			}
		}
	} while (next_permutation(selector.begin(), selector.end()));

	return result;
}


template<IntegralSymbol Symbol>
inline map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess> SGPAlgorithm<Symbol>
	::substringIndices(const GrammarString<Symbol>& str, size_t maxLen)
{
	auto& s = str;

	if (maxLen == 0)
		maxLen = s.systemMatrixSize();

	map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess> indices;

	for (size_t i = 0; i < s.systemMatrixSize(); i++)
	{
		const size_t maxL = std::min(maxLen, s.systemMatrixSize() - i);
		for (size_t length = 1; length <= maxL; length++)
		{
			GrammarStringView<Symbol> tview(s.data() + i, length);		

			auto it = indices.find(tview);

			if (it == indices.end())
			{
				indices.emplace(GrammarString<Symbol>(tview.begin(), tview.end()), vector<size_t>{i});
			}
			else
			{
				it->second.push_back(i);
			}
		}
	}

	return indices;
}

template<IntegralSymbol Symbol>
inline map<Symbol, GrammarStringView<Symbol>> SGPAlgorithm<Symbol>
	::substringRules(const map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess>& indices)
{
	map<Symbol, GrammarStringView<Symbol>> expandedRules;

	for (const auto& [substr, locations] : indices)
	{
		if (substr.systemMatrixSize() >= 2)
		{
			auto loc0 = locations[0];

			for (size_t loc : locations)
			{
				if (loc >= loc0 + substr.systemMatrixSize())
				{
					auto A = takeNextFreeVariableSymbol();
					expandedRules.emplace(A, GrammarStringView<Symbol>(substr));

					break;
				}
			}
		}
	}

	return expandedRules;
}

template<IntegralSymbol Symbol>
inline vector<set<Symbol>> SGPAlgorithm<Symbol>::substringSymbolCovers(
	const GrammarStringView<Symbol>& t,
	const map<GrammarString<Symbol>, vector<size_t>, GrammarStringLess>& indices, 
	const map<Symbol, GrammarStringView<Symbol>>& rules)
{
	vector<set<Symbol>> covers(t.size());

	for (size_t i = 0; i < t.size(); i++)
	{
		covers[i] = set<Symbol>{ t[i] };	// Be sure to include the terminal symbol at position i.

		for (const auto& [var, rhs] : rules)
		{
			auto it = indices.find(rhs);

			if (it != indices.end())
			{
				for (size_t loc : it->second)
				{
					if (loc <= i && i < loc + rhs.size())
					{
						covers[i].insert(var);
						break;
					}
				}
			}
		}
	}

	return covers;
}
