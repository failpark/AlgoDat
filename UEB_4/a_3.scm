(load "a_2.scm")

(define (primzahl? n)
	(= (fakt n) 1)
)
(primzahl? 11)
(primzahl? 26737)
(primzahl? 200)
(primzahl? 121)
