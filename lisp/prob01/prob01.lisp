; FIXME: fix. is broken.

(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

(defun foo ()
  "Returns sum of 1..1000, divisible by 3 and 5"
  (apply #'+ 
    (loop :for i :from 1 :to 1000
	 :collect (if (and (divisibleBy i 3)
			   (divisibleBy i 5))
		      i
		      0))))
