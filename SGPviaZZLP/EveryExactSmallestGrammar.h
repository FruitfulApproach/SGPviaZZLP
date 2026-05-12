#pragma once

#include "SGPAlgorithm.h"
#include <Highs.h>

template<IntegralSymbol Symbol>
class EveryExactSmallestGrammar :
    public SGPAlgorithm<Symbol>
{
private:
    vector<HighsInt> columnInd;     // system column index -> HiGHs library matrix column index
    vector<bool> solution;          // 01 solution values
    map<Symbol, vector<map<Symbol, size_t>>> mapToCol;      // container, index, cover -> columnInd
    map<GrammarString, vector<size_t>> C;       // "compressibles", but here actually reducibles witin s (includes all 'ab' with s=..(ab)t(ab).. for example)
    unordered_map<Symbol, GrammarString> R;     // rules

protected:
    virtual void addSysVarForSym(Symbol sym);
    static unordered_map<Symbol, vect
};

