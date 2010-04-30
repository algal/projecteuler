
## functional

# gives (F1,F2,F3,...)
def fib():
    a,b=1,1

    while True:
        yield a
        a,b = b,a+b

# gives ((1,F1),(2,F2),(3,F3),...)
from itertools import izip, count
countedfib = izip(count(1),fib())

# gives ((n,Fn),(n+1,F(n+1)),...)
#  where Fn contains more than 1000 digits
from itertools import ifilter
longfibs = ifilter(lambda (n,fn): len(str(fn)) >= 1000, countedfib)

n,fibn = longfibs.next()


## iterative
def getn():
    a,b,counter=1,1,1
    while True:
        if len(str(a)) >= 1000:
            return counter
        a,b,counter = b, a+b, counter+1


