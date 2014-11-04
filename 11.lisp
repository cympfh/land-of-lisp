(format t "Chapter ~$ starts up!!~%" 11)
(let ((k (format nil "Chapter ~$ starts up!!" 11)))
  (princ (reverse k))
  (fresh-line))

(format t "| leftpadding  |~10a|~%" 'value)
(format t "| rightpadding |~10@a|~%" 'value)

(format t "|<---10--->|~%")
(format t "|~10,,2a|~%" 'value)
(format t "|~10,,2a|~%" 'valuevalue)

(format t "i can remember pi = ~,10f (omitted)~%" 3.141592653589793238462643383279502884197106)

(defun random-animal ()
  (nth (random 5)
       '(dog tick tiger wlrus kangaroo)))

(loop repeat 10
      do (format t "~5t~a ~15t~a ~25t~a~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))

(loop repeat 10
      do (format t "~30<~a~;~a~;~a~>~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))

(defvar animals
  (loop repeat 10 collect (random-animal)))

(format t "~{There is a ~a.~%~}" animals)
