(define (mod-mul a b mod)
  (remainder (* a b) mod))
(define (square-mod x mod)
  (mod-mul x x mod))
(define (even? x)
  (= 0 (remainder x 2)))
(define (exp-mod-iter a n mod prod)
  (cond
    ((= n 0) prod)
    ((even? n) (exp-mod-iter (square-mod a mod) (/ n 2) mod prod))
    (else (exp-mod-iter a (- n 1) mod (* prod a)))))
(define (exp-mod a n mod)
  (if 
    (= 0 (remainder a mod)) 0 (exp-mod-iter a n mod 1)))
