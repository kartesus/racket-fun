#lang racket

(require racklog)

(define %parent
        (%rel ()
              [('Wilma 'Pebbles)]
              [('Fred 'Pebbles)]
              [('Homer 'Bart)]
              [('Dick 'Harry)]
              [('Sam 'Tim)]
              [('William 'Henry)]
              [('Henry 'John)]
              [('Mary 'Sam)]
              [('Dick 'Harriet)]
              [('Tom 'Dick)]
              [('George 'Sam)]
              [('Tim 'Sue)]))

(%assert! %parent () (['Homer 'Lisa]))
(%assert-after! %parent () (['Homer 'Maggie]))
(%which [c] (%parent 'Homer c))

(define %grand
        (%rel (g p c)
              ([g c]
               [%parent g p]
               [%parent p c])))

(%which [k] (%grand 'Tom k))