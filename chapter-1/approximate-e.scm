(define (cont-frac-iter n d i k result)
  (define (transform-result result i)
    (/ (n i) (+ result (d i))))
  (if (= i 1)
      result
      (cont-frac-iter n d (- i 1) k (transform-result result (- i 1)))))
(define (cont-frac n d k)
  (cont-frac-iter n d (+ k 1) k 0.0))
(define (e-d i)
  (cond 
    ((< i 3) (* 1.0 i))
    ((or (= 0 (remainder i 3)) (= 1 (remainder i 3))) 1.0)
    (else (/ (+ i 1) 1.5))))
(define (approximate-e k)
  (+ 2.0 (cont-frac (lambda(x) 1.0)
                    e-d
                    k)))
