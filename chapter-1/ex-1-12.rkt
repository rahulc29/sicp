#lang racket
(define (binomial-coefficients n k)
  (cond
    ((= k 0) 1)
    ((= n 0) 1)
    ((= n k) 1)
    (else (+ (binomial-coefficients (- n 1) (- k 1))
             (binomial-coefficients (- n 1) k)))))
(binomial-coefficients 7 2)