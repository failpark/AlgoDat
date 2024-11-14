(define (osterformel j)
	(let* (
		(a (remainder j 19))
		(b (remainder j 4))
		(c (remainder j 7))
		(k (floor (quotient j 100)))
		(p (floor (/ (+ (* 8 k) 13) 25)))
		(q (floor (/ k 4)))
		(M (remainder (- (+ 15 k) p q) 30))
		(N (remainder (- (+ 4 k) q) 7))
		(d (remainder (+ (* 19 a) M) 30))
		(e (remainder
				(+
					(* 2 b)
					(* 4 c)
					(* 6 d)
					N
				)
				7
			)
		))
		(+
			22
			d
			e
		)
	)
)
(osterformel 2010)
(osterformel 2011)
(osterformel 2013)
