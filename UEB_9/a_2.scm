#lang racket
(define (liste-teilen input)
	(define (helper input left right counter)
		(if (null? input)
			(list left right)
			(let*
				(
					(val (car input))
					(input (cdr input))
					(left (if (even? counter) (append left (list val)) left ))
					(right (if (odd? counter) (append right (list val)) right ))
					(counter (+ counter 1))
				)
				(helper input left right counter)
			)
		)
	)
	(helper input '() '() 0)
)

(liste-teilen '(1 2 3 4 5 6 7 8 9))
(liste-teilen '(1 2 3 4 5 6 7 8 9 10))
(liste-teilen '())

