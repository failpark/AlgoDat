(define (teilen text sep)
	(define (replace in sep out)
		(cond
			((null? sep) in)
			((null? in) (replace (reverse out) (cdr sep) '()))
			(else
				(let*
					(
						(curr_char (car in))
						(is_sep (eq? curr_char (car sep)))
						(char (if is_sep #\space curr_char))
						; could probably use push if we used vecs? --> TODO read script
						(in (cdr in))
						(out (cons char out))
					)
					(replace in sep out)
				)
			)
		)
	)
	(define (split-space text out)
		(cond
			((null? text) (reverse (build_string out)))
			((eq? (car text) #\space) (split-space (cdr text) (cons '() (build_string out))))
			(else
				; seems complex but all this does ist update the first list in out (which is the word we currently write)
				(split-space (cdr text) (cons (cons (car text) (car out)) (cdr out)))
			)
		)
	)
	(define (build_string out)
		(cons (list->string (reverse (car out))) (cdr out))
	)
	(let*
		(
			(sep (string->list sep))
			(text (string->list text))
			(text (replace text sep '()))
			(text (split-space text '(())))
		)
		(filter (lambda (x) (not (= (string-length x) 0))) text)
	)
)
(teilen "nach den Abschluss-Prüfungen, kommen die Ferien" ",-")