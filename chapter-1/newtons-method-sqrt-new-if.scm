#lang racket
(define (new-if predicate consequent alternative)
  (cond (predicate (consequent))
        (else (alternative))))
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (update-guess x y)
  (average y (/ x y)))
(define uncertainty-limit 0.0000001)
(define (check-bounds? x y)
  (< (abs (- (square y) x)) uncertainty-limit))
(define (sqrt-iter x y (predicate? check-bounds?)) ; The default predicate is to check bounds to be within a given uncertainty limit
  (new-if (predicate? x y)
      y
      (sqrt-iter x (update-guess x y) predicate?)))
(define (sqrt x)
  (sqrt-iter x 1.0))
(sqrt 9) ; Program fails due running out of memory
; when the condition in an if-expression fails
; the alternative expression is not evaluated
; but in new-if :
; even if the predicate is false, due to eager evaluation, both arguments must be evaluated
; therefore the recursion never stops