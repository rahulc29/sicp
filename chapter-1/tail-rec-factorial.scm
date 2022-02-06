#lang racket
(define (pred n) (- n 1))
(define (fact-iter n product)
  (if (= n 1)
      product
      (fact-iter (pred n) (* product n))))
(define (fact n) (fact-iter n 1))
(fact 1)