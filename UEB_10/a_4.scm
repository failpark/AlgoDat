(define (vector-add . vecs)
	(define (helper in out)
		(if (null? in) out
			(helper (cdr in) (map + out (car in)))
		)
	)
	(helper (cdr vecs) (car vecs))
)
(vector-add '(1 2) '(1 2))
(vector-add '(1 2 3) '(4 5 6) '(7 8 9))