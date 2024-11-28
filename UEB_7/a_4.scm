#lang racket
(define (operation ops n)
	(define (get_op count ops stop)
		(if (= count stop)
			(car ops)
			(get_op (+ count 1) (cdr ops) stop)
		)
	)
	(lambda (x) (
		(get_op 1 ops n)
		; get the first element
		(car x)
		; we could not simply use cdr since cdr of a list is the POINTER
		; to the next element so we have to follow the pointer and with car
		; get the actual value at that location in the list .-. ffs
		(car (cdr x))
	))
)
(define plus (operation (list + - * /) 1))
(plus (list 1 2))
(define minus (operation (list + - * /) 2))
(minus (list 1 2))
