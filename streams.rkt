#lang racket

(for* ([i (in-range 2 7 4)]
       [j (in-range 1 4)])
  (display (list i j (* i j)))
  (newline))

(for/list ([x (in-naturals)] #:break (> x 10)) (sqr x))

(for/list ([x (in-range 11)]) (sqr x))

(for/list ([x (in-range 11)] #:when (even? x)) (sqr x))

(for/and ([x '(2 4 6)]) (even? x)) ;; ∀x ∈ {2, 4, 6}, x mod 2 = 0

(for/or ([x '(2 7 4 6)]) (> x 5))  ;; ∃x ∈ {2, 7, 4, 6}, x > 5

(for/first ([x '(2 1 4 6 7 1)] #:when (> x 5)) x)

(for/last ([x '(2 1 4 6 7 1)] #:when (> x 5)) x)

(for/sum ([i (in-range 1 11)]) (sqr i))

(for/product ([i (in-range 1 11)]) (sqr i))