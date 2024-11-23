(define (zaehlen start ende n)
	(define (comp n)
		(= n 0)
	)
	(define (helper iter find ende stop)
		(let*
			(
				(rem_3 (remainder iter 3))
				(rem_7 (remainder iter 7))
				(find (if (and (comp rem_3) (comp rem_7)) (+ find 1) find))
			)
			(cond
				((= find stop) iter)
				((< ende iter) 0)
				(else
					(helper (+ iter 1) find ende stop)
				)
			)
		)
	)
	(helper start 0 ende n)
)
