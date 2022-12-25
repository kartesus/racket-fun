#lang racket

(define (sum-rec n)
  (if (= 0 n) 0
      (+ n (sum-rec (- n 1)))))

(define (sum-pure n)
  (let loop ([n n] [acc 0])
       (if (= 0 n) acc
           (loop (- n 1) (+ acc n)))))

(define (sum-while n)
  (let ([s 0])           ;; initialize s to zero
       (do ()            ;; an optional initialzer statement can go here
           ((< n 1))     ;; do until this becomes true
           (set! s (+ s n))
           (set! n (- n 1)))
           s))

(define (sum-until n)
  (let ([s 0])
    (do ([i 1 (add1 i)])   ;; initialize i=1, set i += 1 at each iteration
        ((> i n) s)        ;; do until i > n, then return s
        (set! s (+ s i)))))
    

(sum-until 100)