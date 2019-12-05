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

(define test-rest-of-queens (list (list (list 1 1) (list 2 2) (list 3 3))))

(define (adjoin-position n k rest-of-queens)
  (append rest-of-queens (list(list n k))))

(define empty-board (list(list(list))))

(define (safe? k positions)
  (is-already-exist-y
  

;(((1,1), (2,2), (3,3)) , ((1, 2), (2, 3), (3, 1)), ((1, 3), (2, 1), (3, 2)))