;; Copyright 2018 Google LLC


(library
    (lambda-5)
  (export do-test)
  (import (rnrs))

  ;; Test if we can capture locals
  (define (make-adder x)
    (lambda (y)
      (+ x y)))
  
  (define (do-test)
    (eq? ((make-adder 4) 5) 9)))
