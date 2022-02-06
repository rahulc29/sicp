#lang racket
(define (pred x) (- x 1))
(define (succ x) (+ x 1))
(define (add-iter a b sum)
  (if (= b 0)
      sum
      (add-iter a (pred b) (succ sum))))
(define (add a b)
  (add-iter a b a))
(add 30 44)