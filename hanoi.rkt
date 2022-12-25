#lang racket

(define (hanoi n f t)
  (if (= 1 n)
      (list (list f t))                   ;; only a single disk to move
      (let* ([u (- 3 (+ f t))]            ;; determine unused peg
             [m1 (hanoi (sub1 n) f u)]    ;; move n-1 disks from f to u
             [m2 (list f t)]              ;; move single disk from f to t
             [m3 (hanoi (sub1 n) u t)])   ;; move disks from u to t
        (append m1 (cons m2 m3)))))

(hanoi 3 0 2)