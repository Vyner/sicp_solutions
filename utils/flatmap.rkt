#lang racket

(require "../utils/accumulate.rkt")

(define (my-flatmap proc seq)
  (accumulate append null (map proc seq)))


(provide my-flatmap)

(display "import my-flatmap")