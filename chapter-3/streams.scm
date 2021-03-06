#lang sicp
(define (force x) (x))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
(define (empty-stream) '())
(define (memo-proc proc)
  (let ((already-run? false)
        (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))
(define (delay-impl x)
  (memo-proc (lambda () x)))
(define-syntax delay
  (syntax-rules ()
    ((_ x) (delay-impl x))))
(define-syntax stream-cons
  (syntax-rules ()
    ((_ x y) (cons x (delay y)))))
(define (stream-foldr stream f id)
  (if (stream-null? stream)
      id
      (delay (f (stream-car stream)
         (stream-foldr (stream-cdr stream) f id)))))
(define (stream-map stream f)
  (stream-foldr stream (lambda (curr rest)
                         (stream-cons (f curr) rest))
                (empty-stream)))
(define (stream-filter stream pred)
  (stream-foldr stream (lambda (curr rest)
                         (if (pred curr)
                             (stream-cons curr rest)
                             rest))
                (empty-stream)))
(define (stream-ref stream index)
  (if (= 0 index)
      (stream-car stream)
      (stream-ref (stream-cdr stream)
                  (- index 1))))