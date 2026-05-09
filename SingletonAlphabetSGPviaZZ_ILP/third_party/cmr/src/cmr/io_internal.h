#ifndef CMR_IO_INTERNAL_H
#define CMR_IO_INTERNAL_H

#include <stdio.h>

#include <cmr/env.h>


#ifdef _WIN32 /* getline is not available under Windows. */

#ifdef _MSC_VER
typedef __int64 ssize_t;
#ifndef restrict
#define restrict __restrict
#endif
#endif /* _MSC_VER */

ssize_t getline(char** restrict lineptr, size_t* restrict n, FILE* restrict stream);

#endif /* _WIN32 */


#endif /* CMR_IO_INTERNAL_H */
