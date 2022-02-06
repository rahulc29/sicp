#lang racket
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (even? x)
  (= 0 (remainder x 2)))
(define (fast-mul a b)
  (cond
    ((= b 1) a)
    ((even? b) (double (fast-mul a (halve b))))
    (else (+ a (double (fast-mul a (halve (- b 1))))))))
(fast-mul 3 4)
(fast-mul 5 7)