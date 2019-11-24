#lang racket
(require racket/include);
(include "../utils/flatmap.rkt")




(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (my-flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-rows)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
