(define (nat-wurzel x)
	(define (iter sum uneven count x)
		;(println sum)
		(if (= sum x)
			count
			(iter
				(+ sum uneven)
				(+ uneven 2)
				(+ count 1)
				x
			)
		)
	)
	(cond
		((< x 0) #f)
		((= x 0) 0)
		((> x 0) (iter 0 1 0 x))
	)
)
