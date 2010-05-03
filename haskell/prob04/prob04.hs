import Char (digitToInt)

-- | gives list of digits of n, reversed
integerDigitsRev n = map (`mod` 10) . takeWhile (/= 0) . iterate (`div` 10) $ n
-- integerDigits n = map (Char.digitToInt) (show n)

-- | is n a Palindromic number?
isPalindrome n = digits == reverse digits where digits = integerDigitsRev n

palindromes = filter isPalindrome  [a * b | a <- [100..999], b<-[100..999], a <= b]

maxpalindrome = foldr max 0 palindromes

answer = maxpalindrome

