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
    from eulertoolspy.functionalpy import icross, ifilter
    from itertools import takewhile, imap
    products = icross(xrange(100,999),xrange(100,999))
    products = ifilter(lambda (a,b): a<b, products)
    products = imap(lambda (a,b): a*b, products)
    products = ifilter(isPalindrome,products)

    return products

answer = max(getpalindromes())
    
