;; Copyright 2019 Google LLC


(library
    (trivial)
  (export do-test)
  (import (rnrs)
          (rnrs mutable-pairs))

  (define (do-test)
    (let ((x '(a b c)))
      (set-cdr! (cddr x) x)
      (and (list? '())
           (list? '(a b c))
           (not (list? 'a))
           (not (list? '(a . b)))
           (not (list? x))))))
