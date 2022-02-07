(define (square x)
  (* x x))
(define (square-mod x mod)
  (remainder (square x) mod))
(define (mul-mod a b mod)
  (remainder (* a b) mod))
(define (even? x)
  (= 0 (remainder x 2)))
(define (exp-mod a b mod)
  (cond
    ((= b 0) 1)
    ((even? b) (square-mod (exp-mod a (/ b 2) mod) mod))
    (else (mul-mod a (exp-mod a (- b 1) mod) mod))))
(exp-mod 3 4 7)