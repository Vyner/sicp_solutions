#lang racket
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(define (sum a b term next)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b  term next))))

(define (inc n)
  (+ n 1))

(define (sum-cube a b)
  (sum a b cube inc))

(sum-cube 1 10)