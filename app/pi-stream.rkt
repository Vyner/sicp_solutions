#lang racket
(require "../utils/partial-sums.rkt")

(define (pi-summands n)
  (stream-cons (/ 1 n) (stream-map - (pi-summands (+ n 2)))))

(define pi-stream
  (stream-map (lambda (x) (* x 4)) (partial-sums (pi-summands 1))))

;;Test;;
(stream-ref pi-stream 10)
