(load "make-segment.rkt")

(define (get-length-num shape)
  (let ((line (length shape)))
  (abs (- (x-point (start-segment line)) (x-point (end-segment line))))))

(define (get-width-num shape)
  (let ((line (width shape)))
  (abs (- (y-point (start-segment line)) (y-point (end-segment line))))))

(define (make-rectangle a b)
  (cons a b))
(define (length shape) (car shape))
(define (width shape) (cdr shape))

(define (get-rectangle-square shape)
  (* (get-length-num shape) (get-width-num shape)))

(define (get-rectangle-perimeter shape)
  (* (+ (get-length-num shape) (get-width-num shape)) 2))

(define rect-1-length (make-segment (make-point 0 0) (make-point 2 0)))
(define rect-1-width (make-segment (make-point 0 0) (make-point 0 1)))
(define rect-1 (make-rectangle rect-1-length rect-1-width))

;|* ------------------------ *|

(define (make-rectangle-2 length-1 length-2 width-1 width-2)
    (cons (cons length-1 length-2)
          (cons width-1 width-2)))


(define (length-1-rectangle r)
    (car (car r)))

(define (length-2-rectangle r)
    (cdr (car r)))

(define (width-1-rectangle r)
    (car (cdr r)))

(define (width-2-rectangle r)
    (cdr (cdr r)))

(define length-1 (make-segment (make-point 1 4)
                                     (make-point 4 4)))
(define length-2 (make-segment (make-point 1 2)
                                     (make-point 4 2)))
(define width-1 (make-segment (make-point 1 2)
                                    (make-point 1 4)))
(define width-2 (make-segment (make-point 4 2)
                                    (make-point 4 4)))
(define rect-2 (make-rectangle-2 length-1 length-2 width-1 width-2))

(define (length shape) (car (car shape)))
(define (width shape) (cdr (cdr shape)))

