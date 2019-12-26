#lang racket
(define (power base exp)
  (cond ((= base 0) 0)
        ((= base 1) 1)
        ((= exp 0) 1)
        ((= exp 1) base)
        (else (* base (power base (- exp 1))))))

(provide power)
(display "import power")
(newline)