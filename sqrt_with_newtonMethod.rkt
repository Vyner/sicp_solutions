(define (square x)
  (* x x))

(define (fixed-point f x)
  (if (
       (lambda (f x)
         (< (abs
             (- x (f x)))
            0.000001)) f x)
      x
      (fixed-point f (f x))))

(define (deriv g)
  (lambda (x)
  (/ (- (g ( + x dx)) (g x))
     dx)))

(define dx 0.0001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newton-method (lambda (y) (- (square y) x))
                 1.0))