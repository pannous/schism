;; Copyright 2018 Google LLC


(library
    (fold-left)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (eq? 10 (fold-left (lambda (a b) (+ a b)) 0 '(1 2 3 4)))))
