#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0) x y))
(test 0 (p)) ; Does not halt :P
; In applicative order evaluation (eager)
; arguments to the function (procedure) are evaluated at the time of function invocation
; `0` is evaluated to `0`
; Evaluation of `p` leads to the evaluation of `p` leads to the eval....
; Try it : you will have to kill the process