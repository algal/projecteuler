(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

(defun revfib (n)
  "Returns reversed fibonacci sequence up to n"
  (if (= n 2)
      (list 1 1)
      (let ((seq (revfib (- n 1))))
	(cons (+ (car seq)
		 (cadr seq))
	      seq))))

; experimentation shows (< (car (revfib 33)) 4000000)
; experimentation shows (> (car (revfib 34)) 4000000)
(defparameter *answer* (apply #'+ (remove-if-not (lambda (x)
						   (divisibleBy x 2))
						 (revfib 33))))
  