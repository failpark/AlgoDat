#lang racket
(define (hamming left right)
	(define (helper left right counter)
		; we can assume, that we only get same length lists
		(if (null? left)
			counter
			(let*
				(
					(val_l (car left))
					(val_r (car right))
					(counter (if (= val_l val_r) counter (+ counter 1)))
				)
			(helper (cdr left) (cdr right) counter)
			)
		)
	)
	(helper left right 0)
)

(hamming '(1 0 1 1 0 1 0 1) '(0 1 1 1 0 1 0 0))
(hamming '(1 0 1) '(1 0 1))