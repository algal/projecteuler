import Data.Map (empty,lookup,insert,delete,insertWith)

-- | prime numbers
primes = sieve [2..]

-- | sieve xs for primes
sieve xs =  sieve' xs Data.Map.empty
    where sieve' [] table     = []
          sieve' (x:xs) table =
              case Data.Map.lookup x table of
                Nothing    -> x : sieve' xs (Data.Map.insert (x*x) [x] table)
                Just facts -> sieve' xs (foldl reinsert (Data.Map.delete x table) facts)
              where
                reinsert table prime = Data.Map.insertWith (++) (x+prime) [prime] table

-- | tests primality
isPrime n = n `elem` (sieve [2..n])

-- -- tests primality by naive trial division
-- isPrime :: (Integer a) => a -> Bool
-- isPrime 1 = False
-- isPrime 2 = True
-- isPrime n = not $ any (\x -> (mod n x == 0)) [2..(n-1)]

-- should: use an efficient sieve to generate the primes.
-- do extra sieving to exclude circle peers

answer = length $ circularPrimesTo 1000000

circularPrimesTo n = takeWhile (< n) . filter isCircularPrime $ primes

isCircularPrime n = all isPrime (integerRotations n)

-- integerRotations :: (Integral a) => a -> [a]
integerRotations n = map digitsToInt (rotations (integerDigits n))

-- integerDigits = reverse . integerDigitsRev
-- integerDigitsRev n = map (`mod` 10) . takeWhile (/= 0) . iterate (`div` 10) $ n

-- integerDigits :: (Integral a) => a -> [a]
integerDigits = reverse . intToDigitsReversed
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
rotations lst = take (length lst) (iterate rotateList lst)

-- rotates the list by one element, e.g., {1,2,3}:->{2,3,1}
rotateList :: [a] -> [a]
rotateList (x:xs) = xs ++ [x]

