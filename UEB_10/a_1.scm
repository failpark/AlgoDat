(define (removeFirstLast input)
	(define (helper in out first)
		(if (null? (cdr in)) out
		(let*
			(
				(val (car in))
				(in (cdr in))
				(out (if first out (cons val out)))
			)
			(helper in out #f)
		))
	)
	(let*
		(
			; pre-reverse the list
			; technically could do it after helper returns
			; this way it's a less crowded call
			(input (reverse (string->list input)))
		)
		(if (null? input)
			""
			(list->string (helper input '() #t))
		)
	)
)
(removeFirstLast "Hallo Welt")
(removeFirstLast "Algorithmik")
(removeFirstLast "")
