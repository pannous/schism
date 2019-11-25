;; Copyright 2018 Google LLC


(library
    (fold-right)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (eq? 55 (fold-right (lambda (x a) (+ a (* x x))) 0 '(1 2 3 4 5)))))
