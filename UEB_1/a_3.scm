(define (my-max x y)
	(cond
		; if (x > y) return x;
		((> x y) x)
		; if (x < y) return y;
		((< x y) y)
		; we could catch = with  <= but we're extra like that
		((= x y) x)
	)
)
