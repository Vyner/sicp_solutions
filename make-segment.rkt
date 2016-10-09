(define (make-point x y)
  (cons x y))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment a b)
  (cons a b))

(define (start-segment line) (car line))
(define (end-segment line) (cdr line))

(define (midpoint-segment line)
  (make-point (/ (+ (x-point (start-segment line)) (x-point (end-segment line))) 2)
              (/ (+ (y-point (start-segment line)) (y-point (end-segment line))) 2)))

(define (print-point p)
  (newline)
  (display " (")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define a (make-point 3 6))
(define b (make-point 6 2))
(define line1 (make-segment a b))