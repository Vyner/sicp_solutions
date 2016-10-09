(define (cons a b)
  (* (power 2 a) (power 3 b)))

(define (power a b)
  (if (= b 1)
      a
      (* a (power a (- b 1)))))

(define (car z)
  (define (recount n counts)
    (if (not (= (remainder n 2) 0))
        counts
        (recount (/ n 2) (+ counts 1))))
  (recount z 0))

(define (cdr z)
  (define (recount n counts)
    (if (not (= (remainder n 3) 0))
        counts
        (recount (/ n 3) (+ counts 1))))
  (recount z 0))