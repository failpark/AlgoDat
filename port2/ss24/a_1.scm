#lang racket
(require math/number-theory)

(define (primzahlen f)
  (define (helper f n)
    (if (prime? (f n))
        (helper f (+ n 1))
        (if (= n 0) #f (- n 1))
    )
  )
  (helper f 0)
)

(define (f n) (+ (* n n) n 41))
(primzahlen f)
(define (f2 n) (+ (- (* n n) (* 79 n)) 1601))
(primzahlen f2)