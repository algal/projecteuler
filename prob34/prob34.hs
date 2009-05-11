import Char

curiousQ :: Int -> Bool
curiousQ n =
    let fact i = product [1..i]
        integerDigits n = map digitToInt (show n)
        curioustotal n = sum (map fact (integerDigits n))
    in n > 2 && n == curioustotal n

answer = sum ([x | x <- [1..2540160], curiousQ x])

-- slower:
intToDigits :: (Integral a) => a -> [a]
intToDigits = reverse . intToDigitsReversed
intToDigitsReversed  n | (n == digit) = [digit]
                       | otherwise    = digit : intToDigitsReversed rest
    where (rest, digit) = quotRem n 10

