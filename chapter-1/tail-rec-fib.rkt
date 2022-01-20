#lang racket
(define (fib-iter a b count n)
  (if (= count n)
      a
      (fib-iter b (+ a b) (+ count 1) n)))
(define (fib n)
  (fib-iter 0 1 1 n))
(fib 6)