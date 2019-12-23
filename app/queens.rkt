#lang racket
(require "../utils/flatmap.rkt")
(require "../utils/enumerate-interval.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (my-flatmap
         ;在前k-1列放置k-1个皇后的一种方式
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   ; 将新的行列格局加入格局集合
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


(define test-rest-of-queens (list (list 1 1) (list 2 2) (list 3 3)))

(define test-rest-of-queens2 (list (list (list 1 1) (list 2 2)) (list (list 1 2) (list 2 1))))


;(define (adjoin-position n k rest-of-queens)
;  (append rest-of-queens (list(list n k))))

(define (adjoin-position n k rest-of-queens)
  (cons (list n k) rest-of-queens))

(define empty-board (list))

;(define (safe? k positions)
;  (if
;   (empty? positions)
;      true
;      (not (has-repeat-fst-number
;            (get-left-value-in-position positions)))))

(define (safe? k positions)
  (if (empty? positions)
      true
      (safe-position? (first positions) (rest positions))))

(define (safe-position? position org-list)
  (if (empty? org-list)
      true
      (if (safe-point position (first org-list))
          (safe-position? position (rest org-list))
          false)))



(define (getx position)
  (car position))

(define (gety position)
  (car (cdr position)))



(define (safe-point a b)
  (if
   (= (getx a) (getx b))
      false
      (if (= (gety a) (gety b))
          false
          (if (= (- (getx a) (gety a)) (- (getx b) (gety b)))
              false
              true))))


                    

(define (has-repeat-fst-number number-list)
  (if (= (length number-list) 0)
      false
      (contain? (first number-list) (rest number-list))))

(define (get-right-value-in-position positions)
  (map
   cdr
   positions))

(define (get-left-value-in-position positions)
  (map
   car
   positions))

(define (contain? x org-list)
  (> (length (filter
   (lambda (elem) (equal? x elem))
   org-list)) 0))


  ;
  ; 测试
  ;
(define temp (list (list 1 3) (list 1 1) (list 2 2)))
 ;(map (lambda (new-row)
                   ; 将新的行列格局加入格局集合
                  ; (adjoin-position new-row 4 test-rest-of-queens))
                ; (enumerate-interval 1 8))
(define fst-board (filter
         (lambda (positions) (safe? 1 positions))
  (my-flatmap
         ;在前k-1列放置k-1个皇后的一种方式
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   ; 将新的行列格局加入格局集合
                   (adjoin-position new-row 1 rest-of-queens))
                 (enumerate-interval 1 8)))
          empty-board))
  )
(queens 4)
;(((1,1), (2,2), (3,3)) , ((1, 2), (2, 3), (3, 1)), ((1, 3), (2, 1), (3, 2)))