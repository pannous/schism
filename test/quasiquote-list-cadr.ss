;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (eq? (car (cdr `(3 ,(+ 4 2)))) 6)))
