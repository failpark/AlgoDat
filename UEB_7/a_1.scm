(define (loesche liste praedikat)
	(cond
		((null? liste) (list))
		((praedikat (car liste)) (loesche (cdr liste) praedikat))
		(else liste)
	)
)
(loesche (list 4 6 8 3 2 4 5) even?)
