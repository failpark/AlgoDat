#lang racket
(define (kubiksumme n)
	(define (cross_sum n sum)
		(if (= n 0)
			sum
			(cross_sum
				(quotient n 10)
				(+ sum (abs (remainder n 10)))
			)
		)
	)
	(define (cubic n)
		(* n n n)
	)
	(cubic(cross_sum n 0))
)
(kubiksumme -234)
(kubiksumme 101042)
(kubiksumme 34567)
(kubiksumme -234)
