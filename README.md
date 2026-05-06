# SGPviaZZLP
There currently exists no quality and open source, and in particular EXACT, solution to the __smallest grammar problem (SGP)__ for a given input string.  I have messed around with various formulations of the problem, and I believe the cleanest is obtained __via integer (ZZ) linear programming (LP)__.  Herein we provide a free C++ solution and explain how it works.  We also discuss, for when the exact algorithm inevitibly bogs down for longer input strings, how to remedy that by coming up with a "local" approximation to the smallest grammars and merging them in a smart way.  And so, one can compute the SGP for their reasearch exactly, for reasonably sided strings, and compute highly compressed versions for much longer strings, which naturally approach the optimal solutions.

This is based upon my own ideas and research.  For getting the integer linear programming part to work, I will be using Claude Opus 4.7 + ATLAS or some other recommended highly optimized linear algebra (LA) library.   However, the idea on how to turn the SGP into a 0-1 integer linear program is quite straight-forward and does not require advanced group theory (GT) or anything like that.  However, to find symmetries in the problem and thus further optimize the exact algorithm, one should definitely appeal to GT methods for analyzing the symmetries.

$$
\int a
$$
