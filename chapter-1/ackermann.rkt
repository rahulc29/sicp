#lang racket
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
(A 1 10) ;  2 ** (10 ** 1) = 1024 
(A 2 4)  ;  2 ** (4 ** 2)  = 65536
(A 3 3)  ;  65536 => makes sense that it's a power of 2 but no idea why
(define (f n) (A 0 n)) ; f = 2 * n
(define (g n) (A 1 n)) ; g = 2 ** n
(define (h n) (A 2 n)) ; h = 2 ** ( 2 ** ( 2 ** ... )) n times
(h 3)
; A(m, n) is the n-composition of A(m - 1, n)
; The n-composition of multiplication is exponentiation
; The n-composition of exponentiation is super-exponentiation