#lang racket
(define mset (mutable-set 5 1/2 7 12 1/2))
(set-member? mset 7)
(set-add! mset 9)