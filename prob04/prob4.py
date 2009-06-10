from __future__ import absolute_import

# begin: kludge to include ../eulertoolspy/functionalpy
import os
import sys
eulerpath = os.path.abspath('..')
if eulerpath not in sys.path:
    sys.path = [eulerpath]+sys.path
# end: kludge


def isPalindrome(x):
    x = str(x)
    for i in xrange(len(x)):
        if x[i] != x[-(i+1)]:
            return False
    return True

def getpalindromes():
    """returns generator of palindromic products of 3-digit numbers.

    This is written in a functional style."""
    from eulertoolspy.functionalpy import icross, ifilter
    from itertools import takewhile, imap
    products = icross(xrange(100,1000),xrange(100,1000))
    products = ifilter(lambda (a,b): a<b, products)
    products = imap(lambda (a,b): a*b, products)
    products = ifilter(isPalindrome,products)

    return products

answer = max(getpalindromes())

def findMaxPalindrome():
    """Returns the max palindromic product of 3-digits numbers"""
    maxpalindrome = 0
    for val in (a*b for a in xrange(100,1000) for b in xrange(100,1000) if a <= b):
        if isPalindrome(val) is True:
            if val > maxpalindrome:
                maxpalindrome = val
    return maxpalindrome


    
