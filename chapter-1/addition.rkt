#lang racket
(define (succ a) (+ a 1))
(define (pred a) (- a 1))
(define (add1 a b)
  (if (= b 0)
      a
      (succ (add1 a (pred b)))))
(define (add2 a b)
  (if (= b 0)
      a
      (add2 (succ a) (pred b))))
(add1 0 5)
(add1 5 12)
(add2 6 0)
(add2 7 3)