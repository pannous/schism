;; Copyright 2018 Google LLC


(library
    (let-star)
  (export do-test)
  (import (rnrs))

  (define (do-test)
    (let* ((x '())
	   (y #f)
	   (y #t))
      y)))
