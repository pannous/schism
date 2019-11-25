;; Copyright 2019 Google LLC


(library
    (list-ref)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let ((list '(a b c d e f)))
      (and (eq? 'a (list-ref list 0))
	   (eq? 'f (list-ref list 5))))))
