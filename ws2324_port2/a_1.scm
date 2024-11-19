(define (zaehleteiler n)
	(define (helper n iter count)
		(let
			(
				(rem (remainder n iter))
				(iter (- iter 1))
			)
			(cond
				((= iter 1) count)
				((= rem 0) (helper n iter (+ count 1)))
				(else (helper n iter count))
			)
		)
	)
	(helper n n 0)
)
