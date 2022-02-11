(define (mul-mod a b mod)
  (remainder (* a b) mod))
(define (square-mod x mod)
  (mul-mod x x mod))
(define (even? x)
  (= 0 (remainder x 2)))
(define (exp-mod-iter a n prod mod)
  (cond 
    ((= n 0) prod)
    ((even? n) (exp-mod-iter (square-mod a mod) (/ n 2) prod mod))
    (else (exp-mod-iter a (- n 1) (mul-mod a prod mod) mod))))
(define (exp-mod a n mod)
  (exp-mod-iter a n 1 mod))

