import Data.List

fact 0 = 1
fact n = n * fact (n-1)

nth_perm 0 xs = xs
nth_perm _ [x] = [x]
nth_perm n xs = x : nth_perm n' (delete x xs)
  where l = length xs
	(d,n') = divMod n $ fact (l-1)
	x = xs !! d

