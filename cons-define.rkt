(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "error input"))))
  dispatch)

(define (car x) (x 0))
(define (cdr x) (x 1))