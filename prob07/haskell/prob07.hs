import Data.Map
-- from ONeil, "The Genuine Sieve of Eratosthenes", p6

sieve xs =  sieve' xs Data.Map.empty
    where sieve' [] table     = []
          sieve' (x:xs) table =
              case Data.Map.lookup x table of
                Nothing    -> x : sieve' xs (Data.Map.insert (x*x) [x] table)
                Just facts -> sieve' xs (foldl reinsert (Data.Map.delete x table) facts)
              where
                reinsert table prime = Data.Map.insertWith (++) (x+prime) [prime] table

primes = sieve [2..]
answer = primes !! (10001-1) -- since primes is 0-based

