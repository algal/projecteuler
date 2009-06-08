n = 600851475143

divisibleBy :: Integer -> Integer -> Bool
num `divisibleBy` factor = (mod num factor == 0)

-- | returns divisors of num
divisors :: Integer -> [Integer]
divisors num = filter (num `divisibleBy`) [1..num]

-- | checks primality via trial division
isPrime :: Integer -> Bool
isPrime 1 = False
isPrime num = not $ any (num `divisibleBy`) [2..(num-1)]

-- | Returns largest prime of num.
-- inefficient. filters all factors by primality
largestFactor num = last . factorInteger $ num 

-- | Returns all prime factors of n.
factorInteger n = primeFactors' n 2 
-- | Returns (1) the prime factors of n above minFac and (2) the
--      composite factors of n whose prime factors are above minFac.
primeFactors' n minFac
    | (minFac*minFac > n) = [n] 
    | n `divisibleBy` minFac = minFac:primeFactors' (n `div` minFac) minFac 
    | otherwise = primeFactors' n (minFac + 1) 
