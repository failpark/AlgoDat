#lang racket
(define (ackermann n m)
	(cond 
		((= n 0) (+ m 1))
		((= m 0) (ackermann (- n 1) 1))
		(else (ackermann (- n 1) (ackermann n (- m 1))))
	)
)
(ackermann 0 0)
(ackermann 0 1)
(ackermann 4 0)
(ackermann 3 1)
(ackermann 3 9)
;(ackermann 4 1) 65533