(define (differentiate f dx)
  (lambda(x) 
    (/ (- (f (+ x dx)) (f x)) dx)))

