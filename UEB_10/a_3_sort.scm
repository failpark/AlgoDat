#lang racket
; we have to use racket here since we use sort here
; maybe just in case one should learn insertion sort if they disable it?

; this is probably the solution that we were supposed to do
; it's also so much shorter
; but the other version was more fun to do and learn
; ¯\_(ツ)_/¯ to each their own

(define (isAnagramm in1 in2)
	(define (normalize in)
		(let*
			(
				(in (string->list in))
				(in (filter (lambda (x) (not (equal? x #\space))) in))
				(in (map char-downcase in))
				(in (sort in char<?))
			)
			in
		)
	)
	(equal?
		(normalize in1)
		(normalize in2)
	)
)
(isAnagramm "Desperation" "A rope ends it")
(isAnagramm "Eleven plus two" "Twelve plus one")
(isAnagramm "test" "testing")
(isAnagramm "testing     " "test")
