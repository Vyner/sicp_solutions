#lang racket
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define (last-pair n)
    (if (= (length n) 1)
        n
        (last-pair (cdr n))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (r-strip items)
  (if (= (length items) 1)
      null
      (cons (car items) (r-strip (cdr items)))))

(define (reverse items)
  (if (= (length items) 0)
      null
      (append (last-pair items) (reverse (r-strip items)))))

     
