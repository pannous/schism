;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test a b)
   (+ a b)))
