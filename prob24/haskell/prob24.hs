import Data.List 

-- also:

lexPerms [x] = [[x]] 
lexPerms xs = concatMap (\x -> map (x:) $ lexPerms $ delete x xs) xs 

solution = (lexPerms [0..9]) !! 999999

mylexPerms [x] = [[x]]
mylexPerms xs = (concatMap (\i -> map (i:) (mylexPerms (delete i xs))) xs)


mylexPerms2 [x] = [[x]]
mylexPerms2 xs = (concatMap f xs)
    where
      f i = map (i:) (mylexPerms2 (delete i xs))

mylexPerms3 [x] = [[x]]
mylexPerms3 xs =
    let f i = map (i:) (mylexPerms3 (delete i xs))
    in (concatMap f xs)

j x = x + 2
i x = x^2
h x = x-9
g x = x^3

f x =(g (h (i (j x))))
ff x = (g . h . i . j) x
fff x = g $ h $ i $ j $ x
ffff x = g . h . i . j $ x

--also: 

fact 0 = 1
fact n = n * fact (n-1)

nth_perm 0 xs = xs
nth_perm _ [x] = [x]
nth_perm n xs = x : nth_perm n' (delete x xs)
  where l = length xs
	(d,n') = divMod n $ fact (l-1)
	x = xs !! d


solved = nth_perm 999999 ['0'..'9']