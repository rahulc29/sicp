(define (count-leaves tree)
  (cond
    ((null? tree) 0)
    ((not (pair? tree)) 1)
    (else (+ (count-leaves (car tree))
             (count-leaves (cdr tree))))))
; comparable to "invert a binary tree"
; but much more general than that
; Space : O(1)
; Time  : O(n), n -> number of elements in the tree
(define (deep-reverse tree)
  (define (iter tree acc)
    (if (null? tree)
        acc
        (iter (cdr tree) (cons (reverse (car tree)) acc))))
  (iter tree '()))
; inorder traversal but generalised
(define (fringe tree)
  (cond
    ((null? tree) tree)
    ((not (pair? tree)) (list tree))
    (else (append (fringe (car tree))
                  (fringe (cdr tree))))))