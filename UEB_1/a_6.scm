(define (squared-max x y z)
	(define (my-square i)
		(* i i)
	)
	(define (my-max a b)
		(cond
			; if (x > y) return x;
			((> a b) a)
			; if (x < y) return y;
			((< a b) b)
			; we could catch = with  <= but we're extra like that
			((= a b) a)
		)
	)
	(my-max
		(my-max
			(my-square x)
			(my-square y)
		)
		(my-square z)
	)
)
