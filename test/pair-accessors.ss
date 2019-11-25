;; Copyright 2018 Google LLC


(library
    (pair-accessors)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (and (eq? 'a (caar '((a b) c)))
         (eq? 'b (cadr '(a b)))
         (eq? 'b (car (cdar '((a b) c))))
         (eq? 'c (car (cddr '(a b c))))
         (eq? 'a (caaar '(((a b) c) d)))
         (eq? 'b (caadr '(a (b c) d)))
         (eq? 'c (car (cddar '((a b c) d))))
         (eq? 'c (caddr '(a b c d)))
         (eq? 'c (car (cdadr '(a (b c) d))))
         (eq? 'd (car (cdddr '(a b c d e))))
         (eq? 'c (caaddr '(a b (c d) e)))
         (eq? 'c (caddar '((a b c) d)))
         (eq? 'c (cadadr '(a (b c) d)))
         (eq? 'c (caddar '((a b c) d)))
         (eq? 'd (car (cdaddr '(a b (c d))))))))
