def fib(value):
    """Returns the next number in the fibonacci sequence"""
    a,b = 1,2
    while b < value:
        yield b
        a,b=b,a+b

answer = sum(i for i in fib(4000000) if i%2==0)

