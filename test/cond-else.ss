;; Copyright 2018 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs))
  
  (define (do-test)
    (cond
     ((zero? 1) #f)
     ((pair? '()) #f)
     (else #t))))
