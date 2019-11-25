;; Copyright 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (and (string=? "" (list->string '()))
         (string=? "abc" (list->string '(#\a #\b #\c))))))
