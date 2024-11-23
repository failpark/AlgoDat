#lang racket
(require sdraw)

(define struktur1
	(cons
		(cons
			24
			(cons 1 2)
		)
		(cons
			20
			(cons 1 1)
		)
	)
)
(sdraw struktur1 #:null-style '/)

(define nil (list))

(define struktur2
	(cons
		(list 7 2 3 1)
		nil
	)
)

(sdraw struktur2 #:null-style '/)

(define struktur3
	(cons
		(list 3 3)
		(list 3 3 (cons 3 3))
	)
)

(sdraw struktur3 #:null-style '/)

(define struktur4
	(cons
		(cons
			(cons
				nil
				(list 6 1 0 2 4)
			)
			(cons 3 3)
		)
		(list 10 7 8 9 3)
	)
)

(sdraw struktur4 #:null-style '/)
