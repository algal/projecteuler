k = 600851475143

# we know p^2 <= x

def primeFactors(x):
    """Calculates all primes of a number.

    This algorithm is the sieve of eratothsenes. But requires a
    collection the size of the number, so no good for large numbers"""
    import math
    candidates = range(2,x)
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

def isPrime(x):
    """ Checks primality.

    Makes O(n) attempted divisions"""
    import math
    for i in xrange(2,1+int(math.sqrt(x))):
#        print "Trying factor i=", i
        if x % i == 0:
            return False
    return True

def findLargestPrimeFactor(x):
    """ Finds largest prime.

    Makes O(N^2) attempted divisions"""
    n = x/2

    while(True):
        if isPrime(n):
            if x % n == 0:
                return n
        n=n-1
    return




plist = [2]

def primes(min, max):
    global plist
    if 2 >= min: yield 2
    i = 3
    while i <= max:
        for p in plist:
            if i%p == 0 or p*p > i: break
        if i%p:
            plist.append(i)
            if i >= min: yield i
        i = i+2
        
def factors(number):
    for prime in primes(2, number):
        if number % prime == 0:
            number = number / prime
            yield prime
        if number == 1:
            raise StopIteration

print max(factors(317584931803))
