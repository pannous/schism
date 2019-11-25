;; Copyright 2018, 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (if (string=? "abc" "def") #f #t)))
