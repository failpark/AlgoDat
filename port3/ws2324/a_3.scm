(define (sortieren haystack predicate)
	(define (helper p origin front back)
		(if (null? origin)
			(append front back)
			(let
				(
					; use redundant prodecures here for better readability
					(val (car origin))
					(origin (cdr origin))
				)
				; if predicate is true the value goes to the front
				; otherwise it goes to the back
				(if (p val)
					(helper p origin (append front (list val)) back)
					(helper p origin front (append back (list val)))
				)
			)
		)
	)
	(helper predicate haystack '() '())
)
(sortieren '(0 1 2 3 4 5 6 7 8 9) odd?)
