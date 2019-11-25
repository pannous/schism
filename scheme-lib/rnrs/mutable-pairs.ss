;; Copyright 2018, 2019 Google LLC


(library (rnrs mutable-pairs)
  (export set-car! set-cdr!)
  (import (rnrs))

  (define (set-car! p a)
    (if (pair? p)
        (%set-car! p a)
        (error 'set-car! "set-car!: not a pair")))
  (define (set-cdr! p d)
    (if (pair? p)
        (%set-cdr! p d)
        (error 'set-cdr! "set-cdr!: not a pair"))))
