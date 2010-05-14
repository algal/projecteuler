(defun divisibleBy (factor num)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

(defun foo ()
  "Returns sum of 1..1000, divisible by 3 and 5"
    (loop :for i :from 1 :to 1000
	 :sum (if (and (divisibleBy 3 i)
			   (divisibleBy 5 i))
		      i
		      0)))

(defparameter *answer* (foo))
(format t "~A" *answer*)

