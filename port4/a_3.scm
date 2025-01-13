(define (ersetzen v pos . data)
	(define (resize bound data)
		(let*
			(
				(data_len (vector-length data))
				(remove_pos (- data_len bound))
			)
			(cond
				((< data_len bound) data)
				; this is invalid
				; need check in cond
				((< remove_pos 1) #())
				(else
					(vector-drop-right data remove_pos)
				)
			)
		)
	)
	(let*
		(
			(data (list->vector data))
			(v_len (vector-length v))
			(bound (- v_len pos))
			(data (resize bound data))
		)
		(cond
			((<= v_len pos))
			((= bound 0))
			((= (vector-length data) 0))
			(else (vector-copy! v pos data))
		)
		; vector-copy! does not return anything so we need to return v manually
		; we just do nothing in every other case (other than else)
		; and return v here
		v
	)
)
(ersetzen (vector 0 1 2 3 4 5) 2 42 #t sin)