(define (werte-aus term zuweisung)
	(define (get_val symbol var_list)
		(cond
			((null? var_list) #f)
			((eq? symbol (caar var_list)) (cadar var_list))
			(else (get_val symbol (cdr var_list)))
		)
	)
	(define (get_value var var_list)
		(if (symbol? var)
			(get_val var var_list)
			var
		)
	)
	(let*
		(
			; turn op to a procedure (was symbol) ('+ vs +)
			(op (eval (car term)))
			(a (get_value (cadr term) zuweisung))
			(b (get_value (caddr term) zuweisung))
		)
		(op a b)
	)
)

(werte-aus '(+ x 2) '((x 7)))
(werte-aus '(* x y) '((x 3) (y 5)))
(werte-aus '(/ a b) '((a 6) (b 3)))