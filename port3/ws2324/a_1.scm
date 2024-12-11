#lang racket
(define (anpassen haystack)
	(define (helper haystack out)
		(if (null? haystack) out
		(let
			(
				(val (car haystack))
				(haystack (cdr haystack))
			)
			(cond
				((odd? val) (helper haystack out))
				((= (remainder val 10) 0) (helper haystack (append out (list (* val val)))))
				(else
					(helper haystack (append out (list val)))
				)
			)
		))
	)
	(helper haystack (list))
)
(anpassen (list 5 9 10 12 20))