-- we number the spiral layers 0 (the center), 1 (3x3), 2 (5x5), etc..



-- gives the length of a layer. e.g. layer 1 is 3 (3x3 grid), layer 2 is 5 (5x5 etc), etc.
len layer = 1 + 2 * layer

-- gives the circumference of a layer
circumference layer = 4*(len layer) -4

-- gives a True/False sequence telling if the items in a layer are diagonals
isdiagonal layer = take (circumference layer) (drop 1 (cycle (True:(replicate ((len layer)-2)) False)))

-- first item 
-- 1001x1001 => (1001-1)/2 = 500 => layer 500

-- builds the sequence for all items, setting the center to true manually
diagonals = True:(concatMap isdiagonal [1..]) 

-- gives the layer of various items
layerOf = 0:(concatMap (\x -> (replicate (circumference x) x)) [1..])
-- find the last item
lastitem = length (takeWhile (\x -> x <= 500) layerOf)

-- collects the diagonal items
diagonalitems = map snd (filter fst (zip diagonals [1..500]))








