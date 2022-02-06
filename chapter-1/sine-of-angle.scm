#lang racket
(define (cube x)
  (* x x x))
(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))
(define (sin x)
  (if (< x 0.1)
      x
      (p (sin (/ x 3)))))
(sin 12.15)