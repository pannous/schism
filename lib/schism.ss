;; Copyright 2019 Google LLC


;; This library contains non-standard Schism-isms.
(library (schism)
  (export gensym list-all-eq?)
  (import (rnrs)
          (%schism-runtime))

  (define (gensym t) ;; Creates a brand new symbol that cannot be reused
    (unless (string? t) (error 'gensym "not a string"))
    (%make-gensym t))
  
  (define (list-all-eq? a b)
    (if (null? a)
        (null? b)
        (and (not (null? b))
             (eq? (car a) (car b))
             (list-all-eq? (cdr a) (cdr b))))))
