#lang racket
(define (verkettung funcs num)
	(define (helper funcs num max)
		(if (null? funcs)
			max
			(let*
				(
					(func (car funcs))
					(val (func num))
					(max (if (< max val) val max))
					(funcs (cdr funcs))
				)
				(helper funcs num max)
			)
		)
	)
	; set the max init to something absurdly low
	; or maybe add a counter and if counter is 0 then set max to that?
	(helper funcs num -999999999999999999999999999)
)

(define prozeduren
	(list
		abs
		(lambda (x) (* x x))
		(lambda (x) (+ x 1))
	)
)
(verkettung prozeduren 6); 36