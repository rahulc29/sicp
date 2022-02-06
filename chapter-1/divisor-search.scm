(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= 0 (remainder b a)))
(define (square x)
  (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(smallest-divisor 4)
(define (prime? n)
  (= n (smallest-divisor n)))