;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (foo x)
    #t)
  
  (define (do-test)
    (foo (cons 1 2))))
