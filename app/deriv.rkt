#lang racket
(require "../utils/power.rkt")

 (define (deriv exp var) 
   (cond ((number? exp) 0) 
         ((variable? exp) 
          (if (same-variable? exp var) 1 0)) 
         ((sum? exp) 
          (make-sum (deriv (addend exp) var) 
                    (deriv (augend exp) var))) 
         ((product? exp) 
          (make-sum 
            (make-product (multiplier exp) 
                          (deriv (multiplicand exp) var)) 
            (make-product (deriv (multiplier exp) var) 
                          (multiplicand exp))))
         ((exponentiation? exp)
          (make-product (make-product (exponent exp)
                                      (make-exponentiation (base exp) (- (exponent exp) 1)))
                        (deriv (base exp) var)))
                       
         (else 
          (error "unknown expression type -- DERIV" exp))))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

(define (exponent exp)
  (caddr exp))

(define (base exp)
  (cadr exp))

(define (make-exponentiation base exp)
  (cond ((=number? 0 base) 0)
        ((=number? 1 base) 1)
        ((=number? 0 exp) 1)
        ((=number? 1 exp) base)
        ((and (number? base) (number? exp)) (power base exp))
        (else (list '** base exp))))
  
  (define (variable? x) (symbol? x)) 
  
  (define (same-variable? v1 v2) 
   (and (variable? v1) (variable? v2) (eq? v1 v2))) 
  
  (define (make-sum a1 a2) 
   (cond ((=number? a1 0) a2) 
         ((=number? a2 0) a1) 
         ((and (number? a1) (number? a2)) (+ a1 a2)) 
         (else (list '+ a1 a2)))) 
  
  (define (make-product m1 m2) 
   (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
         ((=number? m1 1) m2) 
         ((=number? m2 1) m1) 
         ((and (number? m1) (number? m2)) (* m1 m2)) 
         (else (list '* m1 m2)))) 
   
  (define (=number? exp num) 
   (and (and (number? exp) (number? num))
        (= exp num)))
  
  (define (sum? x) 
   (and (pair? x) (eq? (car x) '+))) 
  
  (define (addend s) (cadr s)) 
  
  (define (augend s)
    (if (single-list? (cddr s))
        (caddr s)
        (cons '+ (cddr s))))
  
  (define (product? x) 
   (and (pair? x) (eq? (car x) '*))) 
  
  (define (multiplier p) (cadr p)) 
  
  (define (multiplicand p)
     (if (single-list? (cddr p))
        (caddr p)
        (cons '* (cddr p))))



  (define (single-list? a)
    (cond ((not (list? a)) false)
          ((= (length a) 1) true)
          (else false)))

;; test
;;(deriv '(+ 3 (** x 4)) 'x)

(deriv '(* x y (+ x 3)) 'x)