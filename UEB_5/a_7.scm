(define (q n)
	(cond
		((= n 1) 1)
		((= n 2) 1)
		(else (+
			(q (- n (q (- n 1))))
			(q (- n (q (- n 2))))
		))
	)
)
