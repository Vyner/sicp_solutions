#lang racket
;;用于获得stream的下一个元素
(define (stream-get s)
  (car s))
  

;;用于获得stream剩下的流
(define (stream-remain s)
  (force (cdr s)))

;;获得流中接下来第n个数据
(define (stream-ref s n)
  (if (= n 0) (car s)
      (stream-ref (stream-remain s) (- n 1))))

;;stream-map
(define (stream-map s f)
  (if (stream-empty? s)
      empty-stream
  (cons-stream (f (stream-get s))
               (stream-map (stream-remain s) f))))

;;stream-filter
(define (stream-filter s f)
   (if (stream-empty? s)
      empty-stream
      (if (f (stream-remain s))
          (stream-cons (stream-remain s)
                      (stream-filter (stream-remain s) f))
          (stream-filter (stream-remain s) f))))

;;stream-foreach
(define (stream-foreach s f)
   (if (stream-empty? s)
       'done
       (begin
         (f (stream-get s))
         (stream-foreach (stream-remain s) f))))


;;构造一个空的stream
(define (empty-stream) '())

;;判断stream是否为空
(define (stream-empty? s)
  (eq? s empty-stream))

;;使用cons构造一个stream
(define (cons-stream a b)
  (cons a (delay b)))

;;延迟执行 需要使用宏来定义
;;(define (delay))

;;对delay的函数求值
(define (force func)
  (func))



;; Test ;;
;;;;;;;;;;

;;(define (ones) (cons-stream 1 ones))
(define ones