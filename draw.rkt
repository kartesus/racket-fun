#lang racket

(require racket/draw)

(define drawing (make-bitmap 50 50))
(define dc (new bitmap-dc% [bitmap drawing]))

(define blueish (make-object color% 20 200 200))
(send dc set-pen blueish 2 'solid)
; (send dc set-pen (new pen% [color cyan] [width 2] [style 'solid]))
(send dc set-brush (make-brush #:color "red" #:style 'solid))
(send dc draw-rectangle 0 0 50 25)
(print drawing)