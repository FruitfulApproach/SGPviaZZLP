# SGPviaZZLP
There currently exists no quality and open source, and in particular EXACT, solution to the __smallest grammar problem (SGP)__ for a given input string.  I have messed around with various formulations of the problem, and I believe the cleanest is obtained __via integer (ZZ) linear programming (LP)__.  Herein we provide a free C++ solution and explain how it works.  We also discuss, for when the exact algorithm inevitibly bogs down for longer input strings, how to remedy that by coming up with "locally exact" solutions to the smallest grammars of substrings or chunks within the larger string or stream, and merging them in a smart way.  And so, one can compute the SGP for their reasearch exactly, for reasonably sided strings, and compute highly compressed versions for much longer strings, which naturally approach the optimal solutions.

This is based upon my own ideas and research.  For getting the integer linear programming part to work, I will be using Claude Opus 4.7 + ATLAS or some other recommended highly optimized linear algebra (LA) library.   However, the idea on how to turn the SGP into a 0-1 integer linear program is quite straight-forward and does not require advanced group theory (GT) or anything like that.  However, to find symmetries in the problem and thus further optimize the exact algorithm, one should definitely appeal to GT methods for analyzing the symmetries.



## Ignore the following notes for now, they're just for me:
__Global SGP Approximation Algorithm Notes__

This is for large strings such that even a Quasipolynomial-time algorithm would take seemingly ever to compress.

Scan all chunks linearly at each possible base Symbol offset, up to a maximal allowed chunkSize of <insert experimental number>.

Pick roughly and greedily the (leftmost) chunk R->r with the highest compression ratio: (|r| x #_s(r)) / (#_s(r) + |g*(r)|) where #_s(r) is the number of disjoint copies of r fitting into s and g*(r) is a smallest grammar.  But past a certain size sizeTU <= |r| <= maxSGChunkSize, we require its corresponding ILP system matrix to be totally unitary, so that it's actually going to terminate in some polynomial amount of time.

Once, you have all r's covered by R, you run the algorithm again as if R were a string alphabet symbol, keep running it until the grammar is incompressible.

Except when you go to combine the results of all previous passes with the next pass, you should merge the rules in a smart way.  Same expanded string but one side compresses more, then choose the smaller one.  Needs some thought.

We also might need UTF-8 and a chunkerizer to fit the 10GB of data and support structures into memory.

Adjust the chunk size limits until all together the 10GB of Wikipedia data takes ~ 50 hours to compress. 