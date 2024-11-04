(define (count-perm x)
	(define (count-perm-iter produkt zaehler n)
		(if (> zaehler n)
			produkt
			(count-perm-iter (* zaehler produkt) (+ zaehler 1) n)
		)
	)
	(count-perm-iter 1 1 x)
)