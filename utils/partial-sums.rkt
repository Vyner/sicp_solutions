#lang racket

(define (add-stream a b)
 (stream-cons (+ (stream-first a) (stream-first b)) (add-stream (stream-rest a) (stream-rest b))))

;; 使用(stream-cons 0 (partial-sums))将其本身的进度倒退了一步
(define (partial-sums s)
  (add-stream
   s
   (stream-cons 0 [partial-sums s])))
 
(provide partial-sums)
(display "import partial-sums")

;;Test;;

(define (integer-n n)
  (stream-cons n (integer-n (+ n 1))))

(define integer (integer-n 1))

(stream-ref (partial-sums integer) 3)