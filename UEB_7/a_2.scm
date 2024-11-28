#lang racket
(require sdraw)
(define (drehe liste)
	(define (helper liste result)
		(if (null? liste)
		;(if (eq? (list) liste)
			;(cons result (list))
                        result
			(helper
				(cdr liste)
                                    (cons
					(car liste)
					result
                                    )
                      
			)
		)
	)
	(helper liste (list))
)
(drehe (list 1 2 3))
(sdraw (list 1 2 3))
(sdraw (drehe '(1 2 3)))
(drehe (list 1 2 (list 3)))
(drehe '(1 '(5 6) 2 '(3 4)))
