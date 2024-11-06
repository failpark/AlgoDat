(define (caesar_encrypt n shift)
	(define (helper n shift out)
		(if (= n 0)
			out
			(helper
				(quotient n 10)
				shift
				(+
					(* out 10)
					(+ (remainder n 10) shift)
				)
			)
		)
	)
	(define (rotate n out)
		(if (= n 0)
			out
			(rotate
				(quotient n 10)
				(+
					(* out 10)
					(remainder n 10)
				)
			)
		)
	)
	(rotate(helper n shift 0) 0)
)
(caesar_encrypt 1234 1)
(caesar_encrypt 7901 2)
(caesar_encrypt 987 1)
