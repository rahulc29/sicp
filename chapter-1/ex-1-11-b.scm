#lang racket
(define (f-iter i n a b c)
  (define next (+ a (* 2 b) (* 3 c)))
  (if (= i n)
      next
      (f-iter (+ i 1) n next a b)))
(define (f n)
  (if (< n 3)
      n
      (f-iter 3 n 2 1 0)))
(f 5)