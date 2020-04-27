#lang racket
;; denomination of money: 1, 5, 10
(define (dp-money n)
  (if (<= n 0)
      '()
      (min-list
       (cons 10 (dp-money (- n 10)))
       (cons 5 (dp-money (- n 5)))
       (cons 1 (dp-money (- n 1))))))


(define (min-list a b c)
  (foldl
   smallest
    '()
    (filter
     (lambda (x)
       (
        and
        (not (null? x))
     (> (last x) 0)))
     (list a b c))))

(define (longer a b)
  (if (> (length a) (length b))
      a
      b))

(define (smallest a b)
  (if (< (length a) (length b))
      a
      b))


(dp-money 5)