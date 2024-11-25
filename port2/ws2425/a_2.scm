#lang racket
(define (vergleich zahl op)
	(define (helper n count op)
		(if (= (quotient n 10) 0)
			count
			(let*
				(
					(right (remainder n 10))
					(left (quotient (remainder n 100) 10))
					(count (if (op left right) (+ count 1) count))
					(n (quotient n 10))
				)
				(helper n count op)
			)
		)
	)
	(if (= (quotient (abs zahl) 100) 0)
		#f
		(helper (abs zahl) 0 op)
	)
)
(vergleich 112233 <)
(vergleich 1233 =)
(vergleich -112233 <)