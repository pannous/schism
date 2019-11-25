;; Copyright 2019 Google LLC


(library (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let ((x (let ((q #t))
               (let ((y #t))
                 y))))
      x)))
