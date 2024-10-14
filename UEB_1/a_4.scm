(define (groesser-zehn? x)
	(cond
		; we could also return #t since it's defined as the same (or should be)
		; but beeing more expressive is better for readability
		((> x 10) #true)
		((<= x 10) #false)
	)
)
