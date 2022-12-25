#lang racket

(require math/number-theory)

(define triples '())

(define (gen-triples d1)
  (let* ([q (/ 36 d1)]
         [divs (divisors q)])
    (define (try-div divs)
      (when (not (null? divs))
        (let* ([d2 (car divs)] [d3 (/ q d2)])
          (when (<= d3 d2 d1)
            (set! triples (cons (list d3 d2 d1) triples)))
          (try-div (cdr divs)))))
    (try-div divs)))

(for ([d (divisors 36)]) (gen-triples d))
(for ([triple triples]) (printf "~a: ~a\n" triple (apply + triple)))