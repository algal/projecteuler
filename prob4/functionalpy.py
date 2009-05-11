#!/usr/bin/python
from itertools import ifilter, ifilterfalse, islice, repeat
from itertools import count, imap, takewhile, tee, izip
from itertools import chain, starmap, cycle
import operator
 
# Generic functional functions
 
def any(seq, pred=bool):
    "Return True if pred(x) is True for at least one element in the iterable"
    return (True in imap(pred, seq))
 
def all(seq, pred=bool):
    "Return True if pred(x) is True for all elements in the iterable"
    return (False not in imap(pred, seq))
 
def no(seq, pred=bool):
    "Returns True if pred(x) is False for every element in the iterable"
    return (True not in imap(pred, seq))
 
def take(n, iterable):
    """Take first n elements from iterable"""
    return islice(iterable, n)
 
def takenth(n, iterable):
    "Returns the nth item"
    return islice(iterable, n, n+1).next()
 
def first(iterable):
    """Take first element in the iterable"""
    return iterable.next()
 
def last(iterable):
    """Take last element in the iterable"""
    return reduce(lambda _, y: y, iterable)
 
def takeevery(n, iterable):
    """Take an element from iterator every n elements"""
    return islice(iterable, 0, None, n)
 
def drop(n, iterable):
    """Drop n elements from iterable and return the rest"""
    return islice(iterable, n, None)
 
def icross(*sequences):
    """Cartesian product of sequences (recursive version)"""
    if sequences:
        for x in sequences[0]:
            for y in icross(*sequences[1:]):
                yield (x,)+y
    else: yield ()
 
def mul(nums):
    """Multiply all numbers in nums"""
    return reduce(operator.mul, nums)
 
def get_groups(iterable, n, step):
    """Make groups of 'n' elements from the iterable advancing
    'step' elements each iteration"""
    itlist = tee(iterable, n)
    onestepit = izip(*(starmap(drop, enumerate(itlist))))
    return takeevery(step, onestepit)
 
def flatten(lstlsts):
    """Flatten a list of lists"""
    return list(chain(*lstlsts))
 
def ireduce(func, iterable, init=None):
    """Like reduce() but using iterators (also known also scanl). Non-functional version"""
    if init is None:
        iterable = iter(iterable)
        curr = iterable.next()
    else:
        curr = init
        yield init
    for x in iterable:
        curr = func(curr, x)
        yield curr
