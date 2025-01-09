(define (suche-schrittzahl n)
	(define (to_list in)
		(map
			; nums would be prefixed with char identifier #\
			; to remove this we need to cast to string and then transform to num
			(lambda (x) (string->number (string x)))
			(string->list (number->string in))
		)
	)
	(define (is_valid num_list)
		(if (null? (cdr num_list))
			;checked every num
			#t
			(let*
				(
					(left (car num_list))
					(right (cadr num_list))
					(num_list (cdr num_list))
					(diff (- left right))
					; if difference is -1 or 1 then we are valid for this pair
					(check (or (= -1 diff) (= 1 diff)))
				)
				(if check
					(is_valid num_list)
					; return early and dont check anything else
					#f
				)
			)
		)
	)
	(define (helper n curr)
		(if (= n 1)
			curr
			(let*
				(
					(curr (+ curr 1))
					(valid (is_valid (to_list curr)))
					(n (if valid (- n 1) n))
				)
				(helper n curr)
			)
		)
	)
	(helper n 10)
)
(suche-schrittzahl 1)
(suche-schrittzahl 2)
(suche-schrittzahl 10)
(suche-schrittzahl 25)