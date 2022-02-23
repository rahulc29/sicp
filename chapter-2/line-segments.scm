(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))
(define (average a b)
  (/ (+ a b) 2.0))
(define (midpoint-segment segment)
  (let* ((start (start-segment segment))
         (end (end-segment segment))
         (x-avg (average (x-point start) (x-point end)))
         (y-avg (average (y-point start) (y-point end))))
    (make-point x-avg y-avg)))
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))