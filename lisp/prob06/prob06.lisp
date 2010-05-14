(defun foo ()
  (- (expt (apply #'+ (loop :for i :from 1 :below 101 
			 :collect i) ) 
	   2)
     (apply #'+ (loop :for i :from 1 :below 101 
		   :collect (expt i 2)))))

(defparameter *answer* (foo))
(format t "~A~&" *answer*)

     