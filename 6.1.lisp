(print 'print)
(print "foo")
(print 'foo) ;; print puts newline preceeding

(print 'prin1)
(prin1 "foo")
(prin1 'foo) ;; prin1 never puts newline

(print 'write)
(write "foo")
(write 'foo) ;; write is a synonym of prin1???

(print 'princ)
(princ "foo")
(princ 'foo) ;; display humable and not put newline
(princ '(this a sample))

(print "read an exp >>")
(let ((dat (read)))
  (print dat))

(print "read a line >>")
(let ((ln (read-line)))
  (print ln))
