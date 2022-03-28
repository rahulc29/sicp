(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

; Tail Recursive formulation
; O(1) space and O(n) time

(define (my-reverse list)
  (define (iter list acc)
    (if (null? list)
        acc
        (iter (cdr list) (cons (car list) acc))))
  (iter list '()))

; Append formulation
; O(1) space and O(n^2) time
(define (my-reverse-append list)
  (if (null? list)
      list
      (append (my-reverse-append (cdr list)) (cons (car list) '()))))

