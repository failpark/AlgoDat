(define (loesche liste praedikat)
	(if (praedikat (car liste))
		(loesche (cdr liste) praedikat)
		liste
	)
)
(loesche (list 4 6 8 3 2 4 5) even?)
