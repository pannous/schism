;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (f x y)
    y)
  
  (define (do-test)
    (f 0 1)))
