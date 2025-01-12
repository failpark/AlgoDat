#lang racket
(define (deep-memq val in)
	(if (null? in) #f
		(let*
			(
				(is_list (list? in))
				(check (if is_list (deep-memq val (car in)) (eq? in val)))
			)
			(if (and is_list (not check))
				(deep-memq val (cdr in))
				check
			)
		)
	)
)
(deep-memq 2 '(1 2 3))
(deep-memq 3 '(1 (2 (4 5) 3)))
(deep-memq 3 '((1 5) (2 (7 2 6 4 (4 5) (2 4)))))