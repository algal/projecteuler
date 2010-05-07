; FIXME: fix. is broken.

(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

; imperative
(defun foo ()
  "Returns sum of 1..1000, divisible by 3 and 5"
  (let ((sum 0))
    (loop for i from 1 to 1000
	 (if (and (divisibleBy i 3)
		  (divisibleBy i 5))
	     (incf sum i)))
    sum))
