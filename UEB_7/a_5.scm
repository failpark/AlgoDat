#lang racket
(require sdraw)
(define (caesar_encrypt_list data key)
	; we now could define a seperate function
	; like "get_key" or we could just keep a backup of our key
	; that we set to our key if we've reached the end of key
	(define (helper data key key_backup)
		(if (null? data) (list)
		(let*
			(
				; loop to beginning if we've reached the end
				(key (if (null? key) key_backup key))
				(encrypt_val (remainder (+ (car data) (car key)) 10))
				(data (cdr data))
				(key (cdr key))
			)
			(cons encrypt_val (helper data key key_backup))
		))
	)
	(helper data key key)
)
(caesar_encrypt_list (list 1 2 3 4 5 6) (list 1 3 3 7))
(caesar_encrypt_list '(-11) '(1 2 3 4))
