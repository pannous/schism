;; Copyright 2018 Google LLC


(library
    (lambda-1)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let ((_ (lambda (x) x)))
      #t)))
