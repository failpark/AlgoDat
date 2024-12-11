#lang racket
(define (tuerme-von-hanoi n)
	; manually traverse the list and app(end) the element
	(define (app list_ item)
		(if (null? list_)
			(cons item (list))
			(cons (car list_) (app (cdr list_) item))
		)
	)
	; jesus f-ing christ ...
	; anyhow ... I think ur supposed to realize / learn how to pass quoted values around ...
	(define (helper n src tmp dest out)
		(if (= n 1)
			(app out (cons src dest))
			; doing let* to do one after the other
			; instead of writing
			; (helper (- n 1) tmp src dest (append (helper (- n 1) src dest tmp out) (cons src dest))
			; (I think... haven't and won't test this)

			; unimportant note for myself:
			; how to rewrite let & let* in lambdas
			; https://stackoverflow.com/questions/15939122/how-to-rewrite-let-in-terms-of-lambda
			(let*
				(
					(out (helper (- n 1) src dest tmp out))
					(out (app out (cons src dest)))
				)
				(helper (- n 1) tmp src dest out)
			)
		)
	)
	; reversing the list with reverse did not work because "PROPER LIST" expected
	; ... whatever the hell that means
	(helper n 'a 'b 'c (list))
)
(tuerme-von-hanoi 3)
'((a . c) (a . b) (c . b) (a . c) (b . a)(b . c) (a . c))
