; these 3 values are equal
(print (equal () nil))
(print (equal '() nil))
(print (equal () '()))

(defun -length (list)
  (if list
    (1+ (-length (cdr list)))
    0))

(print (-length '(1 2 3))); 3

(if (oddp 5) 'ok (/ 1 0)) ; has no error

(case t
  (() (print 'no-time))
  (otherwise (print 'else-form-with-otherwise)))

; equal comparison

(print 'symbol-eq)
(print (eq 'a 'a)); T
(print (equal 'a 'a)); T

(print 'number-eq)
(print (eq 1 1)); T
(print (equal 1 1)); T

(print 'string-eq)
(print (eq "abc" "abc")); NIL
(print (equal "abc" "abc")); T

(print 'recur-type-eq)
(print (eq (cons 1 2) (cons 1 2))); NIL
(print (equal (cons 1 2) (cons 1 2))); T

(print '(Conrad rule. --- comparison of symbols are done with eq and others are done with equal))

(print 'int-and-float)
(print (equal 3 3.0)); NIL
(print (equalp 3 3.0)); T

(print 'equalp-ignores-case)
(print (equalp "aBc" "Abc")); T
