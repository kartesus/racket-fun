#lang at-exp racket

(require infix)

(define (quad a b c)
  (let ([d 0])
    @${ d := sqrt[b^2 - 4 * a * c];
        {(-b + d) / (2 * a), (-b - d) / (2 * a)}}))
