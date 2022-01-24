#lang racket
(define (exp a b)
  (if (= b 0)
      1
      (* a (exp a (- b 1)))))
(define (exp-iter a b prod)
  (if (= b 0)
      prod
      (exp-iter a (- b 1) (* prod a ))))
(define (expt a b)
  (exp-iter a b 1))