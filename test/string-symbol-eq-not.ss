;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))
  
  (define (do-test)
    (if (eq? (string->symbol "abc") (string->symbol "def"))
        #f #t)))
