#lang racket
(define (update-guess x y)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))
(define uncertainty-limit 0.0000001)
(define (check-bounds? prev next)
  (< (/ (abs (- next prev)) prev) uncertainty-limit))
(define (cbrt-iter x y (predicate? check-bounds?))
  (define next (update-guess x y))
  (if (predicate? y next)
      next
      (cbrt-iter x next predicate?)))
(define (cbrt x)
  (cbrt-iter x 1.0))
(cbrt 0.6107750584038675) ; Prints 0.8484516487970842, same as Python