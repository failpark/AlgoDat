#lang racket
; sadly we HAVE to use racket here since they moved set-car and set-cdr
; to m<variant>


; I want to do a struct which is a list of pairs
; '((<char> . <num>))
; the purely functional approach would probably be to cons a new pair with the updated val
; and to remove the pointers before and after to from the old pair to the new pair
; which is total overkill for updating a counter .-.
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
	(define (check_pair a b)
		; and short-circuits and doesn't check the rest if b is false
		(and b (equal? (mcar a) (mcar b)) (equal? (mcdr a) (mcdr b)))
	)
	(define (is_space val)
		(equal? val #\space)
	)
	(define (check a haystack)
		(if (null? a) #t
		(let*
			(
				(val_a (mcar a))
				(ptr_b (massoc (mcar val_a) (mcdr haystack)))
				(a (mcdr a))
			)
			; or short-circuits if is_space is true
			(if (or (is_space val_a) (check_pair val_a ptr_b))
				(check a haystack)
				#f
			)
		))
	)
	(define (check_tables a b)
		; better would be to remove matching pairs from b and then in the end check if b is empty
		; but since I don't want to impl more and compute is free we check twice :)
		(and
			(check (mcdr a) b)
			(check (mcdr b) a)
		)
	)
	(check_tables
		(init_table in1)
		(init_table in2)
	)
)
(isAnagramm "Desperation" "A rope ends it")
(isAnagramm "Eleven plus two" "Twelve plus one")
(isAnagramm "test" "testing")
(isAnagramm "testing     " "test")