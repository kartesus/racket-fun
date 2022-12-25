#lang at-exp racket

(require infix plot)

(plot (function sin #:color "Blue")
      #:x-min (* -2 pi) #:x-max (* 2 pi)
      #:title "The Sine Function")

(plot (list (axes)
            (function sin #:color "blue" #:label "sin" #:style 'dot)
            (function cos 0 (* 2 pi) #:color "red" #:label "cos"))
      #:x-min (* -2 pi) #:x-max (* 2 pi)
      #:y-min -2 #:y-max 2
      #:title "Sine and Cosine"
      #:x-label #f
      #:y-label #f)

(plot (list (axes)
            (function sin #:color "blue" #:label "sin" #:style 'dot)
            (inverse sqr -2 2 #:color "red" #:label "x^2" #:width 2))
      #:x-min (* -2 pi) #:x-max (* 2 pi)
      #:y-min -2 #:y-max 2
      #:title "Sine and Square"
      #:x-label #f
      #:y-label #f
      #:legend-anchor 'bottom-left)

(define r 30)
(define off (+ 5 (* 2 r)))

; algebraic half-circles
(define (c1 x) @${  sqrt[r^2 - x^2] })
(define (c2 x) @${ -sqrt[r^2 - x^2] })

; parametric circle
(define (cp t) @${vector[off + r * cos[t], r * sin[t]]})

(plot (list (axes)
            (function c1 (- r) r #:color "blue" #:label "c1")
            (function c2 (- r) r #:style 'dot   #:label "c2")
            (parametric cp 0 (* 2 pi) #:color "red" #:label "cp" #:width 2))
      #:x-min (- r)
      #:x-max (+ off r)
      #:y-min (- r)
      #:y-max (+ off r)
      #:legend-anchor 'top-right)

(define (cycloid t) @${ vector[r * (t - sin[t]), r * (1 - cos[t])] })
(plot (list (axes)
            (parametric cycloid 0 (* 2 pi) #:color "red" #:samples 10000))
      #:x-min 0
      #:x-max (* r 2 pi)
      #:y-min 0
      #:y-max (* r 2 pi))

(parameterize
    ([plot-width 200]
     [plot-height 200]
     [plot-tick-size 0]
     [plot-font-size 0]
     [plot-x-label #f]
     [plot-y-label #f])
  (define (rose k)
    (plot (polar (λ (t) @${sin[k*t]}) 0 (* 4 pi)
                 #:x-min -1 #:x-max 1
                 #:y-min -1 #:y-max 1)))
  (for/list ([k '(1 1.5 2 2.5 3 4 5)]) (rose k)))