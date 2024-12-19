(define (naechster-nachbar input point)
	(define (get_dist a b)
		(+
			(abs(- (car a) (car b)))
			(abs(- (cdr a) (cdr b)))
		)
	)
	(define (get_struct point val)
		(let*
			(
				(val_dist (get_dist point val))
				(struct (cons val_dist val))
			)
			struct
		)
	)
	(define (helper input point min)
		(if (null? input) (cdr min)
			(let*
				(
					(val (car input))
					(val_dist (get_dist point val))
					(min (if (< val_dist (car min)) (cons val_dist val) min))
					(input (cdr input))
				)
				(helper input point min)
			)
		)
	)
	(if (and (list? input) (pair? point) (not(null? input)) (not(null? point)))
		(helper input point (get_struct point (car input)))
		#f
	)
)

(naechster-nachbar '((0 . 0) (4 . 4)) '(1 . 2))
