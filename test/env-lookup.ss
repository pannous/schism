;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let ((env `(,(cons 'p 0))))
      (eq? (cdr (assq 'p env)) 0))))
