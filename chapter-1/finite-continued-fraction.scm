(define (cont-frac-iter n d i k)
  (if 
    (= i k)
    (/ (n i) (d i))
    (/ (n i) (+ (d i) (cont-frac-iter n d (+ i 1) k)))))
(define (cont-frac n d k)
  (cont-frac-iter n d 1 k))
(define (inverse-golden-ratio k)
  (cont-frac (lambda(i) 1.0)
	     (lambda(i) 1.0)
	     k))

