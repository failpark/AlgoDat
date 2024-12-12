#lang racket
(define (listen-verschmelzen input)
	(define (helper left right counter out)
		(cond
			((null? left) (append out right))
			((null? right) (append out left))
			((even? counter)
				(helper
					(cdr left)
					right
					(+ counter 1)
					(append out (list (car left)))
				)
			)
			((odd? counter)
				(helper
					left
					(cdr right)
					(+ counter 1)
					(append out (list(car right)))
				)
			)
		)
	)
	(helper (car input) (cadr input) 0 '())
)
(listen-verschmelzen '((1 3 5 7 9) (2 4 6 8 10)))
(listen-verschmelzen '((1 3 5) (2 4 6 6 6)))
(listen-verschmelzen '(() ()))
(listen-verschmelzen '(() (1 2 3 4)))
(listen-verschmelzen '((1 2 3 4) ()))