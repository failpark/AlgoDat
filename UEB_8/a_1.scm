(define (compress haystack)
	(define (helper haystack needle counter result)
		(define compress (if (= counter 1) (list needle) (list counter needle)))
		(if (null? haystack)
			(append result compress)
			(let*
				(
					(next (car haystack))
					(same (eq? needle next))
					(result (if same result (append result compress)))
					(counter (if same (+ counter 1) 1))
				)
				(helper
					(cdr haystack)
					next
					counter
					result
				)
			)
		)
	)
	(if (null? haystack)
		'()
		(helper (cdr haystack) (car haystack) 1 '())
	)
)
(compress '(a b c))
(compress '(a b b c c c))
(compress '(a b b c c c a b c))
(compress '(a a a a a a a a a a))
(compress '())
(compress '(a))
