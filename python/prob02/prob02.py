def fib(maxval):
    """Returns the fibonacci sequence below maxval"""
    a,b = 1,1
    while a < maxval:
        yield a
        a,b=b,a+b


answer = sum(i for i in fib(4000000) if i%2==0)

# just filters out even values.
# would be more efficient to analyze for the equation for the series of even-valued numbers only, and then generate only them.
