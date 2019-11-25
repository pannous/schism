;; Copyright 2018 Google LLC


(library
    (lambda-4)
  (export do-test)
  (import (rnrs))

  ;; Test if we can call lambdas in a local variable
  (define (do-test)
    (let ((fst (lambda (a b) a))
	  (snd (lambda (a b) b)))
      (and (eq? (fst 1 2) 1)
	   (eq? (snd 1 2) 2)))))
