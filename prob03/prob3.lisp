; imperative version
(defun factorInteger (num) 
  "Returns the prime factors of NUM"
  (when (> num 1) 
    (do ((x 2 (1+ x))) 
	((zerop (mod num x)) 
	 (cons x (factorInteger (/ num x)))))))

(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

; functional version
(defun ffactorInteger (num minFac)
  "Returns the prime factors of NUM"
  (cond ((> (* minFac minFac) num) 
	 (list num))
	((divisibleBy num minFac)
	 (cons minFac (ffactorInteger (/ num minFac) minFac)))
	(t 
	 (ffactorInteger num (1+ minFac)))))


