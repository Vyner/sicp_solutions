#lang racket

(define (enumerate-interval low high)
  (if (> low high)
      null
      (append (list low) (enumerate-interval (+ low 1) high))))

(provide enumerate-interval)
(display "enumerate-interval")