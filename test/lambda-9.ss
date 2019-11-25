;; Copyright 2018 Google LLC


(library
    (lambda-9)
  (export do-test)
  (import (rnrs))

  ;; Test if in lambda
  (define (do-test)
    (eq? 5 ((lambda (b) (if b #f 5)) #f))))
