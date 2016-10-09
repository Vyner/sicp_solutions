(define (cont-frac n d k)
  (define (cf i)
  (if (= k i)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define (cont-frac2 n d k)
    (define (iter i count)
      (if (= i 0)
          count
          (iter (- i 1) (/ (n k) (+ (d k) count)))))
  (iter (- k 1)
        (/ (n k) (d k))))
     