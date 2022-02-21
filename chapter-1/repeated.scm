(define (compose f g)
  (lambda(x) (f (g x))))
(define (repeated f n)
  (define (iter k result)
    (if (= k n)
	result
	(iter (+ k 1) (compose result f))))
  (iter 1 f))
