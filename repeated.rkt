(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (repeated fn n)
  (if (= n 1)
      fn
      (lambda (x)
      (fn ((repeated fn (- n 1)) x)))))

(define (repeated-2 fn n)
  (if (= n 1)
      fn
      (repeated (compose fn fn) (- n 1))))

#|从理解上来讲,repeated-2比repeated更好理解,这也证明了好
的从低到高的抽象架构的重要性(如果一个
复杂程序使用的全是最基本的抽象结构,阅读难度可想而知)  |#