(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

(defun foo ()
  "Returns sum of 1..1000, divisible by 3 and 5"
    (loop :for i :from 1 :to 1000
	 :sum (if (and (divisibleBy i 3)
			   (divisibleBy i 5))
		      i
		      0)))

(defparameter *answer* (foo))
