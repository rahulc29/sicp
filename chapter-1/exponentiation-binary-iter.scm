#lang racket
(define (square x)
  (* x x))
(define (even? x)
  (= 0 (remainder x 2)))
(define (exp-iter a b n)
  (cond
    ((= n 1) (* a b))
    ((even? n) (exp-iter a (square b) (/ n 2)))
    (else (exp-iter (* a b) (square b) (/ (- n 1) 2)))))
(define (exp b n)
  (exp-iter 1 b n))
(exp 3 4)
(exp 7 3)