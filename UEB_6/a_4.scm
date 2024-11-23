(define (konst-ggt x)
	(define (ggt a b)
		(if (= b 0)
			a
			(ggt b (remainder a b))
		)
	)
	(lambda (a) (ggt x a))
)
