from __future__ import absolute_import

# begin: kludge to include ../eulertoolspy/functionalpy
import os
import sys
eulerpath = os.path.abspath('..')
if eulerpath not in sys.path:
    sys.path = [eulerpath]+sys.path
# end: kludge


def isPrimeSlow(n):
    """ Checks primality via 'trial division'.

    Makes n attempted divisions"""
    if n==1:
        return False
    for i in range(2,n):
        if n % i ==0:
            return False
    return True


def isPrime(x):
    """ Checks primality via trial division and a trick.

    We reduce number of trials by relying on:
    1. primefactor^2 < n
    2. primes > 3 expressible as 6k+/-1
    
    Makes O(n) attempted divisions"""
    if x==1:
        # 1 is not prime
        # handled: [1]
        return False
    elif x < 4:
        # 2,3 are prime
        # handled: [1,2,3]
        return True
    elif x % 2 == 0:
        # multiples of 2 are not prime
        # handled: [1,2,3,4] +[6,8,10,...]
        return False
    elif x < 9:
        # 5 & 7 are prime
        # handled: [1,2,3,4,5,6,7,8] +[10,12,14...]
        return True
    elif x % 3 == 0:
        # multiples of 3 are not prime
        # handled: [1,2,3,4,5,6,7,8,9,10] +[12,14...] + 3-divisible
        return False
    # we have now excluded 2-divisibles, 3-divisibles, and [1,10]
    import math

    # we rely on that all primes=>5 can be expressed as 6*k+1 or 6*k-1
    # with k=1,2,..., so that it suffices to check for factors in the
    # set {(6k+1,6k-1) for k in range(1,inf)} < floor(sqrt(x)), i.e.,
    # {(5+6k,5+2+6k) for k in range(0,inf)} < floor(sqrt(x))

    floor = int(math.sqrt(x))

    p = 5
    while p <= floor:
        if x % p == 0 or x % (p+2)==0:
            return False
        p+=6
    return True

    
def primes():
    """Generates list of primes"""
    i = 1
    while True:
        if isPrime(i):
            yield i
        i+=1

from eulertoolspy.functionalpy import takenth
answer = takenth(10001-1,primes()) # 0-based, so correct with -1
