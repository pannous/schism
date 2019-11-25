;; Copyright 2018 Google LLC


(library
    (begin)
  (export do-test)
  (import (rnrs))

  (define (foo) (begin))
  
  (define (do-test)
    (begin (foo) #t)))
