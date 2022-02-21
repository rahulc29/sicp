(define (close-enough? x y)
  (<= (abs (- x y)) 0.000001))
(define (fixed-point-iter f guess)
  (display guess)
  (newline)
  (define next-guess (f guess))
  (if
    (close-enough? guess next-guess)
    next-guess
    (fixed-point-iter f next-guess)))
(define (fixed-point f guess)
  (fixed-point-iter f (f guess)))

