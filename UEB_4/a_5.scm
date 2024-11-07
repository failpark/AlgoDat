#lang racket
(define (caesar_encrypt n shift)
	(define (log10 x)
		(/ (log x) (log 10))
	)
	(define (get_size x)
		(+ (log10 x) 1)
	)
	(define (helper num shift pos out)
		(if (= num 0)
			out
			(helper
				(-
					num
					(* (quotient num (expt 10 pos)) (expt 10 pos))
				)
				shift
				(- pos 1)
				(+ out (*
							(if (>= (+ (quotient num (expt 10 pos)) shift) 10)
								(remainder (+ (quotient num (expt 10 pos)) shift) 10)
								(+ (quotient num (expt 10 pos)) shift)
							)
				(expt 10 pos)))
			)
		)
	)
	(helper n shift (floor(log10 n)) 0)
)
(caesar_encrypt 1234 1)
(caesar_encrypt 7901 2)
(caesar_encrypt 987 1)
