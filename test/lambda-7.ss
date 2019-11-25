;; Copyright 2018 Google LLC


(library
    (lambda-7)
  (export do-test)
  (import (rnrs))

  ;; Test curried functions
  (define (do-test)
    (eq? 5 (((lambda (a) (lambda (b) (+ a b))) 2) 3))))
