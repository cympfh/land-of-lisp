(load "5.lisp")

(defun game-read ()
  (let ((cmd (read-from-string
               (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x) (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

(defun game-eval (sexp)
  (let ((allowed-commands
          '(look walk pickup inventory)))
    (if (member (car sexp) allowed-commands)
      (eval sexp)
      'cannot-eval-it)))

(defun tweak (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eql item #\space) (cons item (tweak rest caps lit)))
            ((member item '(#\! #\? #\.)) (cons item (tweak rest t lit)))
            (lit (cons item (tweak rest nil lit)))
            (caps (cons (char-upcase item) (tweak rest nil lit)))
            (t (cons (char-downcase item) (tweak rest nil nil)))))))

(defun game-print (lst)
  (let ((line (string-trim "() " (prin1-to-string lst))))
    (princ (coerce (tweak (coerce line 'list) t nil) 'string)))
  (fresh-line))

(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))

