#lang racket


(define (make-chessboard n)
        (let loop ([v n] [l '()])
             (if (zero? v)
                 (list->vector l)
                 (loop (sub1 v) (cons (make-vector n 0) l)))))

(define (cb-set! cb r c v)
        (vector-set! (vector-ref cb c) r v))

(define (cb-ref cb r c)
        (vector-ref (vector-ref cb c) r))

(define (cb-copy cb)
        (for/vector ([v cb]) (vector-copy v)))

(define (cb-print cb)
        (let ([n (vector-length cb)])
             (for* ([r n] [c n])
                   (when (zero? c) (newline))
                   (let ([v (cb-ref cb r c)])
                        (if (zero? v)
                            (display " .")
                            (display " Q")))))
         (newline))


(define (dfs n)
        (let ([sols '()]
              [cb   (make-chessboard n)])

             (let loop ([r 0] [c 0])
                  (when (< c n)
                        (let ([valid (not (attacked cb r c))])
                             (when valid
                                   (cb-set! cb r c 1)
                                   (if (= c (sub1 n))
                                       (set! sols (cons (cb-copy cb) sols))
                                       (loop 0 (add1 c)))
                                   (cb-set! cb r c 0))
                             (when (< (add1 r) n) (loop (add1 r) c)))))
          sols))

(define (attacked cb r c)
        (let ([n (vector-length cb)])
             (let loop ([ac (sub1 c)])
                       (if (< ac 0)
                           #f
                           (let ([r1 (+ r (- c ac))]
                                 [r2 (+ r (- ac c))])
                             
                                (if (or                (= 1 (cb-ref cb r  ac))
                                        (and (< r1 n)  (= 1 (cb-ref cb r1 ac)))
                                        (and (>= r2 0) (= 1 (cb-ref cb r2 ac))))
                                    #t
                                    (loop (sub1 ac))))))))

(define (solve n)
        (for ([cb (dfs n)]) (cb-print cb)))
                                             