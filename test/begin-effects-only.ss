;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs)
          (rnrs mutable-pairs))

  (define (do-test)
    (let ((p (cons 1 2)))
      (begin (set-car! p #t) (set-cdr! p #f) (car p)))))
