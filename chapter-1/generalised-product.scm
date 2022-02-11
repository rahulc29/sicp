(define (product a b next term)
  (if (> a b)
      1
      (* (term a) (product (next a) b next term))))
(define (factorial n)
  (product 1 n (lambda(x) (+ x 1)) (lambda(x) x)))
(define (pi-term n)
  (if 
    (even? n) (/ (+ n 2) (+ n 1)) (/ (+ n 1) (+ n 2))))

(define (pi-approx iter)
  (define (pi-approx-value iter)
    (product 1 iter (lambda(x) (+ x 1)) pi-term))
  (* 4.0 (pi-approx-value iter)))