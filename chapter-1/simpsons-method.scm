(define (simpsons-sum-iter k y n sum)
  (if (= k n)
      sum
      (simpsons-sum-iter (+ k 1) y n (+ sum (y k)))))
(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (define k-mod (remainder k 2))
    (define multiplier (f (+ a (* k h))))
    (cond 
      ((or (= 0 k) (= n k)) (* 1 multiplier))
      ((= 1 k-mod) (* 4 multiplier))
      ((= 0 k-mod) (* 2 multiplier))))

  (define (simpsons-sum)
    (simpsons-sum-iter 0 y n 0))
  (* (/ h 3.0) (simpsons-sum)))
