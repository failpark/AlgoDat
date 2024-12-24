#lang racket
(require sdraw)
(require compatibility/mlist)
; sadly we HAVE to use racket here since they moved set-car and set-cdr to a different module
; that thws imports for us

; I want to do a struct which is a list of pairs
; '((<char> . <num>))
; after some searching I found out the name for my structure is a table
; https://web.mit.edu/6.001/6.037/sicp.pdf#section*.226
(define (isAnagramm in1 in2)
	; need to impl assoc manually for mutable lists (thx racket)
	(define (massoc needle haystack)
		(cond
			((null? haystack) #f)
			((equal? needle (mcar(mcar haystack))) (mcar haystack))
			(else (massoc needle (mcdr haystack)))
		)
	)
	(define (init_cell key table)
		(set-mcdr!
			table
			(mcons
				(mcons key 1)
				(mcdr table)
			)
		)
	)
	; if key is found do op otherwise do op_else
	(define (update key table op op_else)
		; ignore space
		(if (char=? key #\space) #t
		(let
			((ptr (massoc key (mcdr table))))
			; just like js
			; vals with stuff are truthy
			(if ptr
				(op ptr)
				(op_else key table)
			)
		))
	)
	(define (generic_op op ptr)
		(set-mcdr! ptr (op (mcdr ptr) 1))
	)
	(define (add ptr)
		(generic_op + ptr)
		#t
	)
	(define (sub ptr)
		(generic_op - ptr)
		(<= 0 (mcdr ptr))
	)
	(define (init_table in)
		(let*
			(
				(table (mcons 'head '()))
			)
			(map
				(lambda (x) (update (char-downcase x) table add init_cell))
				(string->list in)
			)
			table
		)
	)
	(define (check_table table iter)
		(if (null? iter) #t
			(if
				; the lambda is just there as a func to return false
				(update (char-downcase (car iter)) table sub (lambda (a b) #f))
				(check_table table (cdr iter))
				#f
			)
		)
	)
	(let
		(
			(table (init_table in1))
		)
		(check_table table (string->list in2))
	)
)
(isAnagramm "Desperation" "A rope ends it")