;; Copyright 2019 Google LLC


(library
    (mod0)
  (export do-test)
  (import (rnrs))

  (define (for-each f ls)
    (unless (null? ls)
      (f (car ls))
      (for-each f (cdr ls))))
  (define (tests)
    ;; R6RS §11.7.3.1.
    '((123 10 3)
      (123 -10 3)
      (-123 10 -3)
      (-123 -10 -3)))
  (define (do-test)
    (for-each
     (lambda (t)
       (let ((n (car t))
             (d (cadr t))
             (q (caddr t)))
         (unless (eq? q (mod0 n d))
           (display t)
           (newline)
           (error 'do-test "unexpected result"))))
     (tests))))
