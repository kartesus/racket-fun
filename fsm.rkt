#lang racket

(define tape
        (vector 1 1 1 0 1 1 0 0 0 0))

(define head
        0)

(struct act
        (write move next))

(define state-table
        (vector (vector (act 0 #f 0) (act 0 'R 1))
                (vector (act 0 'R 2) (act 1 'R 1))
                (vector (act 1 'L 3) (act 1 'R 2))
                (vector (act 0 'L 4) (act 1 'L 3))
                (vector (act 0 'R 6) (act 1 'L 5))
                (vector (act 0 'R 0) (act 1 'L 5))
                (vector (act 0 'R 7) (act 1 #f 0))
                (vector (act 0 #f 0) (act 1 'H 0))))

(define state
        0)

(define (state-ref s i)
        (vector-ref (vector-ref state-table s)
                    i))

(define (head-val)
        (vector-ref tape head))

(define (tape-set!  v)
        (vector-set! tape head v))

(define (run-machine)
        (let* ([sym (head-val)]
               [actions (state-ref state sym)]
               [move (act-move actions)])
              (cond [(equal? #f move)
                     (printf "Failure in state ~a, head ~a\n~a" state head tape)]
                    [(equal? 'H move)
                     (printf "Done!\n")]
                    [else (let* ([write (act-write actions)]
                                 [changed (not (equal? sym write))])
                                (tape-set! write)
                                (set! head
                                      (if (equal? move 'L)
                                          (sub1 head)
                                          (add1 head)))
                                (when changed
                                      (printf "~a\n" tape))
                                (set! state
                                      (act-next actions))
                                (run-machine))])))