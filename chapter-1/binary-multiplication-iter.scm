#lang racket
(define (even? x)
  (= 0 (remainder x 2)))
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (fast-mul-iter a b k)
  (cond
    ((= k 1) (+ a b))
    ((even? k) (fast-mul-iter a (double b) (halve k)))
    (else (fast-mul-iter (+ a b) (double b) (halve (- k 1))))))
(define (fast-mul a b)
  (fast-mul-iter 0 a b))
(fast-mul 7 11)
(fast-mul 3 4)