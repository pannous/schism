;; Copyright 2018 Google LLC


(library
    (lambda-12)
  (export do-test)
  (import (rnrs))

  ;; Test apply-procedure in lambda
  (define (do-test)
    (let ((f (lambda (x) x)))
      (eq? 5 ((lambda (x) (f x)) 5)))))
