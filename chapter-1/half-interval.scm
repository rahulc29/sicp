; This is basically a kind of "binary search the answer"
(define (good-enough? x)
  (< (abs x) 0.0000001))
(define (average a b)
  (/ (+ a b) 2.0))
(define (solve f a b)
  (let ((midpoint (average a b)))
    (let ((test-value (f midpoint)))
      (cond
        ((> a b) '())
        ((good-enough? test-value) midpoint)
        ((positive? test-value) (solve f a midpoint))
        ((negative? test-value) (solve f midpoint b))
        (else midpoint)))))