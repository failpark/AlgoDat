#lang racket
(define (arbeiten input f1 f2)
	(define (helper input out f1 f2)
		(if (null? input) out
		(let*
			(
				(val (car input))
				(input (cdr input))
			)
			(cond
				((f2 val) (helper input (append out (list val val)) f1 f2))
				(
					(and
						(f1 val)
						(not (f2 val))
					)
					(helper input out f1 f2)
				)
				; when both are false
				(else
					(helper input (append out (list val)) f1 f2)
				)
			)
		))
	)
	(helper input '() f1 f2)
)
(arbeiten '(1 2 "Hallo" #t sin) number? string?); ("Hallo" "Hallo" #t sin)