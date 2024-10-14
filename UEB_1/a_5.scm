(define (groesserp? x y z)
	(cond
		(
			(>
				(+ x y)
				z
			)
			#true
		)
		(else #false)
	)
)
