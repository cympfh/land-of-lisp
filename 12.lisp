(defvar cout (make-string-output-stream))
(princ "hoge" cout)
(princ "fuga" cout)
(princ (get-output-stream-string cout))

(defun print-iota (n)
  (fresh-line)
  (loop for i below n
        do (princ i)))

(print-iota 10)

(with-output-to-string (cout)
  (print-iota 10))

(princ (get-output-stream-string cout))
