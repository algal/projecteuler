(defun divisibleBy (num factor)
  "Returns T if NUM is divisible by FACTOR"
  (zerop (mod num factor)))

; imperative version
(defun factorInteger (num) 
  "Returns the prime factors of NUM"
  (when (> num 1) 
    (do ((x 2 (1+ x))) 
	((zerop (mod num x)) 
	 (cons x (factorInteger (/ num x)))))))

; functional version
(defun ffactorInteger (num &optional (minFac 2))
  "Returns the prime factors of NUM"
  (cond ((> (* minFac minFac) num) 
	 (list num))
	((divisibleBy num minFac)
	 (cons minFac (ffactorInteger (/ num minFac) minFac)))
	(t 
	 (ffactorInteger num (1+ minFac)))))

(defparameter *k* 600851475143)

(defparameter *answer* (car (reverse (ffactorInteger *k*))))
