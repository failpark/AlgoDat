#lang racket
(define (generator func start end)
	(define (helper current out func start end)
		(if (< end current)
			out
			(helper
				(+ current 1)
				(append out (list(func current)))
                                func
				start
				end
			)
		)
	)
	(helper start '() func start end)
)
(generator (lambda (x) (* x x)) 1 5); (1 4 9 16 25)