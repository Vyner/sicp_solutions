#lang racket
(define (fixed-point f x)
  (if (
       (lambda (f x)
         (< (abs
             (- x (f x)))
            0.000001)) f x)
      x
      (fixed-point f (f x))))

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
    (fixed-point (lambda (y) (average y (/ x y)))
                 1.0))
