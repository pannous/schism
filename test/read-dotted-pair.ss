;; Copyright 2018 Google LLC


(library
    (read-dotted-pair)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let ((p (read)))
      (and (pair? p)
           (eq? (car p) 'a)
           (eq? (cdr p) 'd)))))
