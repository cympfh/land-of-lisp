(setf *print-circle* t)

(defparameter cyclic (list 1 2 3))
(print cyclic)

(setf (cdddr cyclic) cyclic)
(print cyclic)

(labels
  ((my-loop (i sup ls)
            (when (< i sup)
              (princ (car ls))
              (my-loop (1+ i) sup (cdr ls)))))
  (my-loop 0 10 cyclic))

(fresh-line)

;; queue (thanks to SICP)

(defun make-queue (ls)
  (let ((q (cons nil nil)))
    (setf (car q) ls)
    (setf (cdr q) (last ls))
    q))

(defun queue-pop! (q)
  (let ((top (caar q)))
    (setf (car q) (cdar q))
    top))

(defun queue-push-back! (q a)
  (setf (cddr q) (cons a nil))
  (setf (cdr q) (cdddr q))
  'done)

(defparameter q (make-queue '(1 2 3)))
(princ "pop: ")
(princ (queue-pop! q))
(fresh-line)

(princ "top 4: ")
(princ (queue-push-back! q 4))
(fresh-line)
(princ "q is: ")
(prin1 q)
(fresh-line)

