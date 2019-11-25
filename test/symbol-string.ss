;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))
  
  (define (do-test)
    (string=? "abc" (symbol->string (string->symbol "abc")))))
