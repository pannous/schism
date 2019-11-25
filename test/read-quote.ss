;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs)
          (schism))

  (define (do-test)
    (list-all-eq? (read) ''5)))
