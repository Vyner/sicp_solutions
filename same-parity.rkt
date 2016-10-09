#lang racket
(define (same-parity . int-num)
  (if (odd? (car int-num))
      (get-odd-list int-num)
      (get-even-list int-num)))

(define (get-odd-list int-num)
  (if (null? int-num)
      null
      (if (odd? (car int-num))
      (cons (car int-num) (get-odd-list (cdr int-num)))
      (get-odd-list (cdr int-num)))))

(define (get-even-list int-num)
  (if (null? int-num)
      null
      (if (even? (car int-num))
      (cons (car int-num) (get-even-list (cdr int-num)))
      (get-even-list (cdr int-num)))))
