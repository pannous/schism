;; Copyright 2019 Google LLC


(library
    (trivial)
    (export do-test)
    (import (rnrs))
    (define (do-test)
        (and (eq? 'four (cdr (assp (lambda (x) (eq? x 4))
                                     '((1 . one)
                                          (3 . three)
                                          (4 . four)
                                          (5 . five)))))
            (eq? #f (assp (lambda (x) (eq? x 0))
                            '((1 . one)
                                 (3 . three)
                                 (4 . four)
                                 (5 . five))))
            (eq? #f (assp (lambda (x) (eq? x 0))
                            '())))))
