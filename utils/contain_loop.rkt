#lang racket

;; to judge if there has a loop in the set 
(define (contain-loop? set)
  (define (contain-loop-set set container)
    (if (empty? set)
        true
        (if [eq? #f [memq (car set) container]]
            [contain-loop-set (cdr set) (cons (car set) container)]
            false)))
  (contain-loop-set set '()))



(contain-loop? '(1 2 3))
(contain-loop? '(1 2 3 1))



