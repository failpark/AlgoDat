(define (root x)
	(root-iter 1.0 x)
)

(define (root-iter guess x)
	(if (good-enough? guess x)
		guess
		(root-iter (improve guess x) x)
	)
)

(define (sqr x) (x * x))

(define (good-enough guess x)
	(<
		(abs (- (sqr guess) x))
		0.00001
	)
)

(define (improve guess x)
	(mean guess (/ x guess))
)

(define (mean guess x)
	(/
		(guess + x) 
		2
	)
)
