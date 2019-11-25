;; Copyright 2018 Google LLC


(library
    (lambda-10)
  (export do-test)
  (import (rnrs))

  ;; Test if in lambda
  (define (do-test)
    (eq? 5 ((lambda () (let ((x 5)) x))))))
