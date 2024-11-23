(define (gleiche-ziffern num)
	(define (log10 x)
		(/ (log x) (log 10))
	)
	(define (get_first_int num)
		(quotient
			num
			(expt 10 (inexact->exact (floor (log10 num))))
		)
	)
	(define (helper iter searched_int)
		(if (= (abs (remainder iter 10)) searched_int)
			iter
			(helper (+ iter 1) searched_int)
		)
	)
	(helper num (get_first_int (abs num)))
)
