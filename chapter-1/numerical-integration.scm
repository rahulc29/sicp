(define (gen-sum term a next b)
  (if (> a b)
      0
      (+ (term a) (gen-sum term (next a) next b))))
(define (sum a b)
  (define (next n)
    (+ n 1))
  (define (term x)
    x)
  (gen-sum term a next b))
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (gen-sum pi-term a pi-next b))
(define (integral f a b dx)
  (define (next a)
    (+ a dx))
  (* (gen-sum f a next b) dx))
