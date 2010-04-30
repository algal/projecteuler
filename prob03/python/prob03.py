from __future__ import absolute_import

# begin: kludge to include ../eulertoolspy/functionalpy
import os
import sys
eulerpath = os.path.abspath('..')
if eulerpath not in sys.path:
    sys.path = [eulerpath]+sys.path
# end: kludge

k = 600851475143

# we know p^2 <= x

def biggestFactor(n):
    candidate = 2
    factor = 1
    # we will keep reducing n by going [n,n/f1, (n/f1)/f2, ..., 1] as
    # we keep updating our latest biggest factor f1,f2,f3 start with n
    while n > 1:
        # if 'factor' is really a factor ...
        if n % candidate == 0:
            # ... remember it as a real factor
            factor=candidate
            # reduce n by that factor, as much as possible
            n = n / factor
            while n % factor ==0:
                n = n / factor
        # try the next possible factor
        candidate += 1
    return factor

def primeFactors(x):
    """Calculates all primes of a number.

    This algorithm is the sieve of eratothsenes. But requires a
    collection the size of the number, so no good for large numbers"""
    import math
    candidates = list(range(2,x))
    primes = []
    while(len(candidates) > 0):
        candidate = candidates.pop(0)
        print "trying candidates = ", candidate
        # if candidate is a prime ..
        if x % candidate == 0:
            print " found a prime ", candidate
            # .. record that and purge its multiples
            primes.append(candidate)
            candidates = [i for i in candidates if i % candidate != 0]

    return primes


def primeFactorsMap(x):
    """Returns a map of all prime factors of x to their powers in x"""
    import math
    factors = {}
    # would rather use list of primes here, instead of integers
    candidates = list(range(2,x))
    while x > 1:
        candidate = candidates.pop(0)
        print "trying candidates = ", candidate
        # if candidate is a factor ...
        if x % candidate == 0:
            print "found a factor ", candidate
            # purge its multiples
#            candidates = [i for i in candidates if i % candidate != 0]

            if candidate not in factors:
                factors[candidate]=0

            while x % candidate ==0:
                # ... record that and purge its multiples
                factors[candidate] += 1
                x = x / candidate
    return factors
            


          
          
          
def isPrime(x):
    """ Checks primality via 'trial division'.

    Makes O(n) attempted divisions"""
    import math
    for i in xrange(2,1+int(math.sqrt(x))):
#        print "Trying factor i=", i
        if x % i == 0:
            return False
    return True

def prime_factors(num, factor=2):
    """Return all prime factors of num in an ordered list"""
    from eulertoolspy.functionalpy import chain, first
    from math import sqrt
    
    if num <= 1:
        return []
    # We know sqrt(num)+1 is the upper bound.
    # a stream of candidate, starting with 'factor'
    # E.g.,   [factor,factor+1,...,sqrt(num)+1,num]
    candidates = chain(xrange(factor, int(sqrt(num))+1), [num])
    # the next actual prime factor is the next candidate factor that is
    # actually a factor
    next = first(x for x in candidates if (num%x == 0))
    # now that we've found next is an actual factor of num, we can
    # divide num/next and look for more factors greater than or equal
    # to next.
    return [next] + prime_factors(num/next, next)
 
answer  = max(prime_factors(k))

