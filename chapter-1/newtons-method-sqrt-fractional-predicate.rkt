#lang racket
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (update-guess x y)
  (average y (/ x y)))
(define uncertainty-limit 0.0000001)
(define (check-bounds? prev next)
  (< (/ (abs (- next prev)) prev) uncertainty-limit))
(define (sqrt-iter x y (predicate? check-bounds?)) ; The default predicate is to check bounds to be within a given uncertainty limit
  (define next (update-guess x y))
  (if (check-bounds? y next)
      next
      (sqrt-iter x next predicate?)))
(define (sqrt x)
  (sqrt-iter x 1.0))
(sqrt 0.9) ; Prints 0.9486832980505138, same as Python :=D