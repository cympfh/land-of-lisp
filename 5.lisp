(defparameter *nodes*
  '((living-room (wizard snoring on the couch))
    (garden (a well))
    (attic (giant welding torch in the corner))))

; *nodes* is alist (assoc-list)
; and `assoc` lookup with it

;;; REPL
(assoc 'garden *nodes*)

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defparameter *edges*
  '((living-room (garden west door)
                 (attic upstairs ladder))
    (garden (living-room east door))
    (attic (living-room downstairs ladder))))

(defun describe-path (edge)
  `(,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (let ((ls (cdr (assoc location edges))))
    (apply #'append (mapcar #'describe-path ls))))

;;; REPL
(describe-paths 'living-room *edges*)

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations*
  '((whiskey living-room)
    (bucket living-room)
    (chain garden)
    (frog garden)))

(defun objects-at (loc objs obj-locs)
  (flet ((at-loc-p (obj)
             (eq (cadr (assoc obj obj-locs)) loc)))
        (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  (flet ((describe-obj (obj)
            `(you see a ,obj on the floor.)))
    (apply #'append
           (mapcar #'describe-obj
                   (objects-at loc objs obj-loc)))))

;;; REPL
(describe-objects 'living-room *objects* *object-locations* )
;; => (YOU SEE A WHISKEY ON THE FLOOR. YOU SEE A BUCKET ON THE FLOOR.)

;; 5.4

(defparameter *location* 'living-room)

(defun look ()
  (print (describe-location *location* *nodes*))
  (print (describe-paths *location* *edges*))
  (print (describe-objects *location* *objects* *object-locations*))
  'done)

;; 5.5

(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
      (progn (setf *location* (car next))
             (look))
      'no-way)))

;; find takes keyword :key
(flet ((cadr-zerop (ls) (zerop (cadr ls))))
  (let ((ans (find t '((x 1) (y 0)) :key #'cadr-zerop)))
    (print ans)))

(defun pickup (object)
  (cond ((member object
                 (objects-at *location* *objects* *object-locations*))
         (push (list object 'body) *object-locations*)
         `(carrying the ,object))
        (t 'cannot-get)))

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))
