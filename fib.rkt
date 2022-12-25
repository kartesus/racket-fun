#lang racket

(define (fib-naive n)
  (if (<= n 1) n
      (+ (fib-naive (- n 1)) (fib-naive (- n 2)))))

(define (fib-iter n)
  (define (iter a b c)
    (if (= c 0) b
        (iter (+ a b) a (- c 1))))
  (iter 1 0 n))

(define fib-m
  (let ([f (make-hash)])
    (define (fib n)
      (cond [(<= n 1) n]
            [(hash-has-key? f n) (hash-ref f n)]
            [else
             (let ([fn (+ (fib (- n 1)) (fib (- n 2)))])
               fn)]))
    fib))

(define (fib-binet n)
  (let* ([ϕ (/ (add1 (sqrt 5)) 2)]
         [ϕ^n (expt ϕ n)])
    (round (/ ϕ^n (sqrt 5)))))


(fib-binet 6)