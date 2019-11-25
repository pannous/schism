;; Copyright 2018 Google LLC


(library
    (lambda-11)
  (export do-test)
  (import (rnrs))

  (define (map2 p a b)
    (if (null? a)
	'()
	(cons (p (car a) (car b)) (map2 p (cdr a) (cdr b)))))
  
  ;; Test if in lambda
  (define (do-test)
     (map2 (lambda (a d) (cons a d)) '(a b c) '(1 2 3))))
