(define (filtered-accumulate-iter combiner null-value a term next b predicate? result)
  (cond 
    ((> a b) result)
    ((predicate? a) (filtered-accumulate-iter combiner null-value (next a) term next b predicate? (combiner result (term a))))
    (else (filtered-accumulate-iter combiner null-value (next a) term next b predicate? result))))
(define (filtered-accumulate combiner null-value a term next b predicate?)
  (filtered-accumulate-iter combiner null-value a term next b predicate? null-value))
(define (smallest-divisor n test-divisor)
  (cond
    ((> (* test-divisor test-divisor) n) n)
    ((= 0 (remainder n test-divisor)) test-divisor)
    (else (smallest-divisor n (+ 1 test-divisor)))))
(define (prime? n)
  (= n (smallest-divisor n 2)))
(define (prime-square-sum a b)
  (filtered-accumulate (lambda(x y) (+ x y)) 0 a (lambda(x) (* x x)) (lambda(x) (+ x 1)) b prime?))
(define (relative-prime-product n)
  (filtered-accumulate (lambda(x y) (* x y)) 1 1 (lambda(x) x) (lambda(x) (+ x 1)) n (lambda(x) (= 1 (gcd x n)))))

