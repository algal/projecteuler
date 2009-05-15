import Char
import Primes


-- bad performance

-- should: use an efficient sieve to generate the primes.
-- do extra sieving to exclude circle peers

answer = length $ circularPrimesTo upperboundPrime

-- is a prime above 10^6
upperboundPrime = 1000000

circularPrimesTo n = takeWhile (< n) $ filter isCircularPrime primes

isCircularPrime n = all Primes.isPrime (integerRotations n)

-- just filters with a primality test, instead of sieving
primes = filter Primes.isPrime [1..]

-- -- tests primality by naive trial division
-- isPrime :: (Integer a) => a -> Bool
-- isPrime 1 = False
-- isPrime 2 = True
-- isPrime n = not $ any (\x -> (mod n x == 0)) [2..(n-1)]

integerRotations :: (Integral a) => a -> [a]
integerRotations n = map digitsToInt (rotations (intToDigits n))


intToDigits :: (Integral a) => a -> [a]
intToDigits = reverse . intToDigitsReversed
intToDigitsReversed  n | (n == digit) = [digit]
                       | otherwise    = digit : intToDigitsReversed rest
    where (rest, digit) = quotRem n 10

digitsToInt  :: (Integral a) => [a] -> a
digitsToInt digits = 
    let powers = [ 10^i | i <- [0..] ]
        digitsReversed = reverse digits
        basevalues = zipWith (*) powers digitsReversed
    in sum basevalues


-- gives all rotations of a list [a].
rotations :: [a] -> [[a]]
rotations lst = take (length lst) (nestList rotateList lst)

-- rotates the list by one element, e.g., {1,2,3}:->{2,3,1}
rotateList :: [a] -> [a]
rotateList (x:xs) = xs ++ [x]

-- gives a list of successive applications of f to initial
nestList :: (a -> a) -> a -> [a]
nestList f initial = initial : nestList f (f initial)

