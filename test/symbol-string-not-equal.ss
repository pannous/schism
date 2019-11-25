;; Copyright 2018, 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))
  
  (define (do-test)
    (not (string=? "def" (symbol->string (string->symbol "abc"))))))
