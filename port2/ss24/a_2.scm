#lang racket
(define (binaer-umrechner bin)
	(define (helper bin dec iter)
		(if (= bin 0)
			dec
			(let*
				(
					(last_bin (remainder bin 10))
					(bin (quotient bin 10))
					(bindec (* last_bin (expt 2 iter)))
					(dec (+ dec bindec))
				)
				(helper bin dec (+ iter 1))
			)
		)
	)
	(helper bin 0 0)
)
(binaer-umrechner 1010)