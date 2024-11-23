(define (paar-operation op)
	(lambda (paar) (op (car paar) (cdr paar)))
)
