#lang racket
(define (square a) 
    (* a a))
(define (sum-of-squares a b) 
    (+ (square a) (square b)))
(define (larger-two a b c) 
    (cond 
    [(and (> a b) (> a c)) (values a (max b c))]
    [(and (> b a) (> b c)) (values b (max c a))]
    [(and (> c a) (> c b)) (values c (max a b))]
    [else (b c)]))
(define-values (a b) (larger-two 2 3 4))
(sum-of-squares a b)