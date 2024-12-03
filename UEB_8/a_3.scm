(define (loeschen haystack counter)
	(cond
		((null? haystack) '())
		((= counter 0) haystack)
		(else (loeschen (cdr haystack) (- counter 1)))
	)
)
(loeschen '(2 3 4 5 6 7) 3)
