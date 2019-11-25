;; Copyright 2018 Google LLC


(library
    (lambda-6)
  (export do-test)
  (import (rnrs))

  ;; Test if we can capture locals
  (define (make-adder x)
    (lambda (y)
      (+ x y)))
  
  (define (do-test)
    (let ((add5 (make-adder 5))
	  (add6 (make-adder 6)))
    (eq? (add5 9) 14))))
