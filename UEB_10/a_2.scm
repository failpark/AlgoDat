(define (sicheresPasswort input)
	(define (is_upper num)
		(and
			; A => 65
			(<= 65 num)
			; Z => 90
			(<= num 90)
		)
	)
	(define (is_lower num)
		; diff from lower to upper is 32
		; a => 97
		;(97 - 32) = 65
		(is_upper (- num 32))
	)
	(define (is_letter num)
		(or
			(is_upper num)
			(is_lower num)
		)
	)
	(define (letter_val num)
		(if (is_letter num) 0 1)
	)
	(define (helper in len non_letter upper lower)
		(if (null? in)
			(and
				(<= 8 len)
				(<= 2 non_letter)
				upper
				lower
			)
			(let*
				(
					(val (char->integer (car in)))
					(upper (or upper (is_upper val)))
					(lower (or lower (is_lower val)))
					(non_letter (+ non_letter (letter_val val)))
					(len (+ len 1))
					(in (cdr in))
				)
				(helper in len non_letter upper lower)
			)
		)
	)
	(helper (string->list input) 0 0 #f #f)
)
(sicheresPasswort "aUljsb!f/KasDhf")
(sicheresPasswort "ABC123")
(sicheresPasswort "aBC123")
(sicheresPasswort "")
