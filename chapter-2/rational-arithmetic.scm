(define (signum x)
  (cond 
    ((positive? x) 1)
    ((negative? x) -1)
    (else 0)))
(define (make-rat n d)
  (define (normalise)
  (let* ((sign (* (signum n) (signum d)))
	(g (gcd n d))
	(abs-n (abs n))
	(abs-d (abs d))
	(gcd-n (/ abs-n g))
	(gcd-d (/ abs-d g)))
    (if 
      (positive? sign)
      (cons (abs n) (abs d))
      (cons (- (abs n)) (abs d)))))
(define (
