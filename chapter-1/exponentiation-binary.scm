#lang racket
(define (square x)
  (* x x))
(define (exp a b)
  (if (= b 0)
      1
      (if (= (remainder b 2) 0)
          (square (exp a (/ b 2)))
          (* a (square (exp a (/ (- b 1) 2)))))))
(exp 2 5)