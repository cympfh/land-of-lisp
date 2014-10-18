; Dear loop language!

(defun prin (exp)
      (princ exp)
      (fresh-line)
      (princ "; => ")
      (prin1 (eval exp))
      (fresh-line))

;; from i to j

(prin
  '(loop for i from 5 to 10
         collect i))

(prin
  '(loop for i from 5 to 10
         sum i))

(prin
  '(loop for i from 0 to 10 by 2
         collect i))

(prin
  '(loop for i from 10 to 0
         collect i))
; ouch! this be NIL (i think because (> 10 0))

;; repeat time
;; === from 0 to (- t 1)

(prin
  '(loop for i
         below 10
         collect i))

;; for in

(prin
  '(loop for i in '(a b c)
         collect i))

;; conditional repeat

(prin
  '(loop for i below 10
         when (oddp i)
         collect i))

;; for-do

(prin
  '(loop for i from 0
         do (print i)
         when (= i 10) return 'done))

; NOTE
; `from` not indicated `to` runs forever

;; parallel for

(prin
  '(loop for x below 10
         for y below 20
         collect (cons x y)))

; NOTE
; x in [0 .. 9]
; y in [0 .. 19]
; these run parallelly.
; And the result's length is 10
; that is the shorter.

;; indexing
(prin
  '(loop for idx from 0
         for d in '(monday tuesday and weekend)
         collect (cons idx d)))

; this use `from` without `to` and parallel

;; named

; named-loop realized jump and longjump

(prin
  '(loop named outer
         for i below 10
         do (return-from outer 'kicked-out)))

(prin
  '(loop named outer
         for i below 10
         do
         (loop named inner
               for j below 3
               do (print (cons i j))
               when (= i 3) do
               (return-from outer 'kicked-out-from-inner))))

;; more and more
