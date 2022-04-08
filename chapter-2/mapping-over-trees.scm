#lang sicp
(define (map-tree func tree)
  (cond
    ((null? tree) tree)
    ((not (pair? tree)) (func tree))
    (else (cons (map-tree func (car tree))
                (map-tree func (cdr tree))))))
(define (square-tree tree)
  (map-tree (lambda (x) (* x x)) tree))
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subset)
                            (cons (car s) subset))
                          rest)))))
(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs) (accumulate op init (cdr seqs)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil 
      (cons (accumulate op
                        init
                        (map (lambda (element)
                               (car element))
                             seqs))
            (accumulate-n op
                          init
                          (map (lambda (seq)
                                 (cdr seq))
                               seqs)))))
(define (vector-addition v w)
  (cond
    ((and (null? v) (null? w)) '())
    ((null? v) w)
    ((null? w) v)
    (else (map + v w))))
(define (matrix-*-vector m v)
  (accumulate 
   vector-addition 
   '() 
   (lambda (row) (map * row v)) 
   m))
(define (transpose m)
  (accumulate-n cons 
                nil
                m))
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (column)
                  (dot-product row column))
                cols))
         m)))