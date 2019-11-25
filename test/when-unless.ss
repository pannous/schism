;; Copyright 2019 Google LLC


(library
    (when-unless)
  (export do-test)
  (import (rnrs))

  (define (Car x)
    (unless (pair? x) (error 'Car "not a pair"))
    (car x))

  (define (do-test)
    (Car '(#t))))
