#lang racket
(require "../utils/accumulate.rkt")


(define (my-map p sequence)
  (accumulate (lambda (first listb) (cons (p first) listb))
              null
              sequence))

  
 (define (my-map2 proc sequence) 
   (accumulate (lambda (first already-accumulated) 
                 (cons (proc first) already-accumulated)) 
               null 
               sequence)) 
  