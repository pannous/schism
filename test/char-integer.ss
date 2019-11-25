;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (eq? (char->integer #\A) 65)))
