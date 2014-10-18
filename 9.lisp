;; array
(defparameter a (make-array 3))
(print a)

(setf (aref a 1) 0)
(print a)
(print (aref a 1))

;; list has also indexing
(defparameter lst (list 'a 'b 'c))
(print (nth 1 lst))

;; hash table
(defparameter h (make-hash-table))

(print h)
(print (gethash 'yup h)) ; nil

(setf (gethash 'yup h) :yup)
(print (gethash 'yup h))

;; multiple-value aka values

(defun tati ()
  (values 1 2 3))

; [160]> (values 0 1 2)
; 0 ;
; 1 ;
; 2

; for continuous, the first value will be used
(print (cons 'tati (tati))) ; (TATI . 1)

(multiple-value-bind (x y z) (tati)
  (print (list x y z)))

;; struct
(defstruct person
  name age sex favorite-colour)

(defparameter cympfh
  (make-person :name 'cympfh))
(print cympfh)

(defparameter Hikasa
  (make-person :age 34 :sex 'female :name 'Yoko))
(print Hikasa)
; unanswered keyword value will be just nil


