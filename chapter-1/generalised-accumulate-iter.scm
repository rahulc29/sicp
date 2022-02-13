(define (accumulate-iter combiner null-value term a next b result)
  (if (> a b)
      result
      (accumulate-iter combiner null-value term (next a) next b (combiner result (term a)))))
(define (accumulate combiner null-value term a next b)
  (accumulate-iter combiner null-value term a next b null-value))
(define (product term a next b)
  (accumulate (lambda(x y) (* x y)) 1 term a next b))
(define (factorial n)
  (product (lambda(x) x) 1 (lambda(x) (+ x 1)) n))

