#lang racket
(require sdraw)
(define h0 (cons 1 1))
(define h1 (list 1 1))
(define a1 (list 1 (list '1 '1) h1))
(define a2 (cons (cons h0 h1) (cons 1 h1 )))
(define a3 (cons (list h0 h1) (list 1 h1 )))
(define a4 (list 1 (cons 1 1) '(list 1 1)))
(define a5 (cons 1 (cons h1 (list 1 1))))
(define a6 (cons (list h0 h1) (list 1 (car h1) (cadr h1 ))))
(define a7 (cons (cons h0 (cons (car h0) (cons (cdr h0 ) '())))
(list 1 (car h1) (cdr h1 ))))
(define a8 (list 1 h1 (cons 1 1)))
(define a9 (list 1 (cons 1 1) h1))
(define a10 (cons (cons h1 h0) (cons h1 1)))

;(sdraw a9)
(sdraw a6 #:null-style '/)