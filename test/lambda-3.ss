;; Copyright 2018 Google LLC


(library
    (lambda-3)
  (export do-test)
  (import (rnrs))

  ;; Test if we can call lambdas in a local variable
  (define (do-test)
    (let ((x (lambda (y) y)))
      (x #t))))
