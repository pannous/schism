;; Copyright 2018 Google LLC


(library
    (lambda-2)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (procedure? (lambda (a b) (+ a b)))))
