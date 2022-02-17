; This is basically a kind of "binary search the answer"
; It seems that this method produces the same answer for a lot of odd functions for the same a and b
; e.g. solving with some 'a' and 'b' will produce the same answer for all x ** n if n is odd
; This function always assumes that the function is monotonic
; I believe this is true for _all_ odd monotonic functions
; If a = -b then (a + b) / 2 = 0 => f(0) = 0 is a valid solution and our procedure returns
; If not, then successive averages can never get to 0
; For an odd monotonic function, the only root is at 0
; So we can never get to the true solution
; This means that the function will terminate iff the range (a, b) becomes small enough (< 0.0000001)
; For the same 'a' and 'b', the sequence of averages will be independent of 'f'
; So for the same 'a' and 'b', the procedure terminates at the same range (a, b)
; The final answer returned is the average of 'a' and 'b' for this final range
; Since the range is independent of 'f', so is the average of 'a' and 'b'
(define (close-enough? x y)
  (< (abs (- x y)) 0.000001))
(define (average a b)
  (/ (+ a b) 2.0))
(define (solve f a b)
  (let ((midpoint (average a b)))
    (let ((test-value (f midpoint)))
      (cond
        ((close-enough? a b) midpoint)
        ((positive? test-value) (solve f a midpoint))
        ((negative? test-value) (solve f midpoint b))
        (else midpoint)))))
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (solve f a b))
          ((and (negative? b-value) (positive? a-value))
           (solve f b a))
          (else
           (error "Values are not of opposite sign" a b)))))