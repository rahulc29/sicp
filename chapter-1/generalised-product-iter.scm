(define (product-iter a b term next result)
  (if 
    (> a b)
    result
    (product-iter (next a) b term next (* result (term a)))))
(define (product a b term next)
  (product-iter a b term next 1))
(define (factorial n)
  (product 1 n (lambda (x) x) (lambda (x) (+ x 1))))
