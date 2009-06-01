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

-- | returns largest prime of num
-- inefficient. filters all factors by primality
largestFactor :: Integer -> Integer
largestFactor num = last $ filter isPrime $ divisors num




