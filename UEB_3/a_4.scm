(define (zylinder-kegel rad_zyl h_zyl rad_keg h_keg)
	(define pi 3.1415926535897932384626433832795)
	(define (vol_zyl r h)
		(*
			pi
			(expt r 2)
			h
		)
	)
	(define (vol_keg r h)
		(*
			(/ 1 3)
			pi
			(expt r 2)
			h
		)
	)
	(/
		(vol_zyl rad_zyl h_zyl)
		(vol_keg rad_keg h_keg)
	)
)
