;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (if (eq? (peek-char) #\A)
        (eq? (peek-char) #\A)
        #f)))
