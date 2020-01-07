#lang racket
(define (make-monitored func)
  (let ((count-number 0))
    (define (how-many) count-number)
    (define count-and-call
      (lambda (x)
        (set! count-number (+ count-number 1))
        (func x)))
    (lambda (call-symbol)
      (cond ((eq? call-symbol 'how-many-calls?) (how-many))
            ((eq? call-symbol 'reset-count) (set! count-number 0))
            (else (count-and-call call-symbol))))))

(define sqrt~ (make-monitored sqrt))

(sqrt~ 20)

(sqrt~ 'how-many-calls?)

             
          