let fib = 1:1:zipWith (+) fib (tail fib)
sum (takeWhile (<4000000) [i | i <- fib, mod i 2 ==0])

-- N.B.: have defined fib as an infinite list, so must use takeWhile instead of filter
-- also: could use "even i" instead of "mod i 2 ==0"

-- other syntaxes
-- sum . takeWhile (< 1000000) . filter even $ fibs 
-- sum (takeWhile (< 4000000) (filter even fib))


