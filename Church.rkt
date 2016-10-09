(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-1 zero)
((lambda (f) (lambda (x) (f ((n f) x)))) (lambda (f) (lambda (x) x)))
(lambda (x) ((lambda (f) (lambda (x) x)) ((n (lambda (f) (lambda (x) x))) x)))

(add-1 (lambda (f)
         (lambda (x)
           x)))

((lambda (n)
   (lambda (f)
     (lambda (x)
       (f ((n f) x)))))
 (lambda (f)
   (lambda (x)
     x)))

(lambda (f)
     (lambda (x)
       (f (
           ( (lambda (f)
               (lambda (x)
                 x))
             f)
           x))))

(lambda (f)
     (lambda (x)
       (f x)))

(define one
  (lambda (f)
     (lambda (x)
       (f x))))

(define two
    (lambda (f)
        (lambda (x)
            (f (f x)))))

(define zero
  (lambda (f)
    (lambda (x) x)))

;;;;;;;;;;;;;;;;;;;;;;

(define three
    (lambda (f)
        (lambda (x)
            (f (f (f x))))))

(define four
    (lambda (f)
        (lambda (x)
            (f (f (f (f x)))))))


(define (+ m n)
    (lambda (m)
        (lambda (n)
            (lambda (f)
                (lambda (x)
                    (m f (n f x)))))))
