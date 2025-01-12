; compare operation
(define (make-suche comp-op)
	(define (search vec elem)
		(define (bin-search left right)
			(let*
				(
					(mid (quotient (+ left right) 2))
					(mid-elem (vector-ref vec mid))
				)
				(cond
					((= elem mid-elem) mid)
					((< right left) #f)
					((comp-op elem mid-elem) (bin-search left (- mid 1)))
					(else (bin-search (+ mid 1) right))
				)
			)
		)
		(bin-search 0 (- vector-length vec) 1)
	)
	(lambda (x y) (search x y))
)
(define bs (make-suche <))
(bs #(1 4 9 17 28 35 49) 28); -> 4