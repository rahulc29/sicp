(define (parity number)
  (remainder number 2))
(define (same-parity . ns)
  (define (traverse list par)
    (cond
      ((null? list) list)
      ((= par (parity (car list))) (cons (car list) (traverse (cdr list) par)))
      (else (traverse (cdr list) par))))
  (traverse ns (parity (car ns))))