(define (summen-verkettung funcs arg)
	(define (helper funcs arg sum)
		(if (null? funcs) sum
			(let*
				(
					(func (car funcs))
					(val (func arg))
					(sum (+ sum val))
					(funcs (cdr funcs))
				)
				(helper funcs arg sum)
			)
		)
	)
	(helper funcs arg 0)
)
(define funcs (list abs (lambda (x) (* x x)) (lambda (x) (+ x 1))))
(summen-verkettung funcs 5)
