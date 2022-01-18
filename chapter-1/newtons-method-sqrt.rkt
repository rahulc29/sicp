#lang racket
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (update-guess x y)
  (average y (/ x y)))
(define uncertainty-limit 0.0000001)
(define (check-bounds? x y)
  (< (abs (- (square y) x)) uncertainty-limit))
(define (sqrt-iter x y)
  (if (check-bounds? x y)
      y
      (sqrt-iter x (update-guess x y))))
(define (sqrt x)
  (sqrt-iter x 1.0))
(sqrt 9) ; Prints 3.000000001396984