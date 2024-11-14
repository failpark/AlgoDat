#lang racket
(define (euler-n n)
	(define (fac-iter prod count n)
		(if (> count n)
			prod
			(fac-iter (* prod count) (+ count 1) n)
		)
	)
	(define (helper sum count)
		(if (< count 0)
			sum
			(helper
				(+
					sum
					(/ 1 (fac-iter 1 1 count))
				)
				(- count 1)
			)
		)
	)
	(if (<= n 0)
		1.0
		(exact->inexact (helper 0 n))
	)
)
(euler-n 0)
(euler-n 1)
(euler-n 2)
(euler-n 27)
