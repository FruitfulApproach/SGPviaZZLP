#pragma once

#include <unordered_map>
#include <map>
#include <vector>
#include <span>
#include <set>
#include <type_traits>
#include <concepts>
#include <algorithm>

using namespace std;

/// Transparent lexicographic comparator: allows std::map heterogeneous lookup
/// so we can find a GrammarString<Symbol> key using a GrammarStringView<Symbol>
/// without materializing a vector copy on every lookup.
struct GrammarStringLess
{
	using is_transparent = void;
	template<typename A, typename B>
	bool operator()(const A& a, const B& b) const
	{
		return std::lexicographical_compare(a.begin(), a.end(), b.begin(), b.end());
	}
};

template<typename Symbol>
concept IntegralSymbol = std::is_integral_v<Symbol>;

template<IntegralSymbol Symbol>
using GrammarString = vector<Symbol>;

template<IntegralSymbol Symbol>
using GrammarStringView = std::span<const Symbol>;

template<IntegralSymbol Symbol>
class StraightLineGrammar
{
private:
	unordered_map<Symbol, GrammarString<Symbol>> P;		// Production rules map: variable symbol -> rhs string (which may contain both terminal and variable symbols)
	Symbol S;	// Start symbol
	set<Symbol> strAlpha;	// Alphabet of all chars seen occuring in s
	set<Symbol> varAlpha;	// Alphabet of rule variable symbols (the lhs of a production rule)

public:
	/// Default ctor is a completely empty grammar, with no production rules and no start symbol.  
	StraightLineGrammar() {}

	/// Copy ctor
	StraightLineGrammar(const StraightLineGrammar& src)
		: P(src.P), S(src.S), strAlph(src.strAlpha), varAlpha(src.varAlpha)
	{
	}

	/// For setting the rhs string of the production rule for variable var. 
	/// Throws if var is not a variable in the grammar.
	GrammarString& operator[](Symbol var)
	{
		return P[var];
	}

	/// Rhs string of the production rule for variable var.  Throws if var is not a variable in the grammar.
	const GrammarString& operator[](Symbol var) const
	{
		return P.at(var);
	}

	/// Set the start symbol of the grammar.
	void setStartSymbol(Symbol S) { this->S = S; }
	
	/// Get the start symbol of the grammar.
	Symbol startSymbol() const { return S; }

	/// Return the standard size of the grammar, which is the sum of the string lengths of all rhs sides of 
	/// production rules.  This is the standard size measure in the literature, and is what we optimize 
	/// for in the ILP formulation.  If you want to change this, for example your compression format is
	/// not exactly this size, then subclass StraightLineGrammar and override this method to compute the 
	/// size according to your needs.  For example, you might want to add a fixed cost per rule. 
	size_t systemMatrixSize() const {  
		size_t sz = 0;
		for (const auto& [_, rhs] : P)
			sz += rhs.systemMatrixSize();
		return sz;
	}

	/// Returns the number of production rules that define this grammar.  Should always equal the number 
	/// of variables in the grammar, since each variable is defined by exactly one production rule in any
	/// straight-line grammar, by definition.
	size_t ruleCount() const { return P.systemMatrixSize(); }

	/// Add a variable symbol to the variable alphabet, so that it can be used in production rules.  
	/// Throws if var is in the string alphabet.
	void addToVariableAlphabet(Symbol var) 
	{
		if (strAlpha.contains(var))
			throw std::logic_error(std::format(
				"Cannot add variable symbol {} to variable alphabet because it is already in the string alphabet.", var));
		varAlpha.insert(var);
	}

	/// Add a terminal string's symbols to the string alphabet, so that it can be used in production rules.
	void addToStringAlphabet(const GrammarString<Symbol>& str) 
	{
		for (Symbol sym : str)
		{
			if (varAlpha.contains(sym))
				throw std::logic_error(std::format(
					"Cannot add terminal symbol {} to string alphabet because it is already in the variable alphabet.", sym));
			strAlpha.insert(sym);
		}
	}
};




