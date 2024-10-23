(define (zahl-umdrehen num)
	(define (reverse-helper n result)
		(if (= n 0)
			result
			(reverse-helper
				(quotient n 10)
				(+
					(* result 10)
					(remainder n 10)
				)
			)
		)
	)

	(reverse-helper num 0)
)
