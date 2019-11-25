;; Copyright 2018 Google LLC


(library
    (map)
  (export do-test)
  (import (rnrs))

  ;; Test curried functions
  (define (do-test)
    (eq? 5 (cadr (map (lambda (x) (+ 1 x)) '(1 4 6))))))
