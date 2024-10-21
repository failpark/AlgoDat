(define (root_own x)
	(define (root-iter guess x)
		(if (good-enough? guess x)
			guess
			(root-iter (improve guess x) x)
		)
	)

	(define (sqr_own x)
		(* x x)
	)

	(define (improve guess x)
		(mean guess (/ x guess))
	)

	(define (good-enough? guess x)
		(<
			(abs (- (sqr_own guess) x))
			0.00001
		)
	)

	(define (mean guess x)
		(/
			(+ guess x)
			2.0
		)
	)

	(root-iter 1.0 x)
)
