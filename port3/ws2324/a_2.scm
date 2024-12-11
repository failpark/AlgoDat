(define (gleich? haystack)
	(define (helper haystack counter)
		(if (null? haystack) (= 0 counter)
		(let
			(
				(next (cdr haystack))
				(val (car haystack))
			)
			(cond
				((< 0 val) (helper next (+ counter 1)))
				((< val 0) (helper next (- counter 1)))
				(else (helper next counter))
			)
		))
	)
	(helper haystack 0)
)
