;; Copyright 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let* ((x (list->string '(#\a #\b #\c)))
           (y (string->symbol x)))
      (and (not (eq? x (list->string '(#\a #\b #\c))))
           (eq? x x)
           (eq? (symbol->string y) (symbol->string y))))))
