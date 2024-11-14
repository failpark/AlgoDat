#lang racket
(define (caesar_encrypt num shift)
	(define (c_pos num shift)
		(remainder (+ num shift) 10))
	(define (c_sum num shift result exponent)
		(if (= num 0)
			result
			(c_sum
				(quotient num 10)
				shift
				(+
					result
					(*
						(c_pos
							(remainder num 10)
							shift
						)
						(expt 10 exponent)
					)
				)
				(+ exponent 1)
			)
		)
	)
	(c_sum num shift 0 0)
)
(caesar_encrypt 1234 1)
(caesar_encrypt 7900 2)
(caesar_encrypt 987 1)