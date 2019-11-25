;; Copyright 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (and (equal? '() (string->list ""))
         (equal? '(#\1 #\2 #\3) (string->list "123")))))
