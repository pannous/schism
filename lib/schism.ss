;; Copyright 2019 Google LLC


;; This library contains non-standard Schism-isms.
(library (schism)
    (export gensym hello Ω deep-eq? concat println print puts puta put sum length len list-all-eq?)
    (import (rnrs)
        (%schism-runtime))


    (define (succeed s.c) `(,s.c))
    (define (fail s.c) '())
    ;        (define ø '())
    ;        (define ƒ #f)

    ; concat'ed signs are FUCKED UP by format!
    ; ¿Ω ≈ç √∫ñ µ «»≤≥÷æ …¬˙∆°©ƒ ∂ß å œ ®'é †¥ü î ø π “≠±- –—)
    ;  ±a ¸a √a ≈a ∑a FUCKED UP by format!
    (define (Ω a b) ; NICE it works
        (cons a b)
    )
    (define (þ a b) ; ¸ alt+shift+z space :(
        (cons a b)
    )
    (define (@ a b) ; RESERVE!
        (cons a b)
    )

    ;    (define (concate a b))

    (define (concat xs)
        (list->string xs) ; todo
    )

    (define (deep-eq? a b)
        (if (and (pair? a) (pair? b))
            (and (deep-eq? (car a) (car b))
                (deep-eq? (cdr a) (cdr b)))
            (eq? a b)))



    (define (hello)
        (write 'hello)
        (newline)
    )

    (define (sum xs)
        (fold-left (lambda (a b) (+ a b)) 0 xs)
    )
    ;    NO NEED, but why fucks up??
    (define (puta xs)
;        <!display unknown unimplemented!> ???
;        (fold-left (lambda (a b) (write a)) 0 xs)
;        (fold-left (lambda (a b) (and (write a) (write b))) "," xs)
        ;        (map write xs)
        (map (lambda (a) (and (write a) (write " "))) xs)
    )

    (define (put xs)
        (if (null? xs)
            (newline)
            (if (pair? xs)
                (and
                    (write (car xs))
                    (write ",")
                    (put (cdr xs))
                )
                (puts xs)
            )
        )
    )

    (define (putsx text)
        (if (pair? text)
            (puta text)
            (and
                (write text) ;        display
                (newline)
            )
        )
    )

    (define (puts text)
        (write text)
        (newline)
    )

    (define (print text) (write text))

    (define (println text)
        (write text)
        (newline)
    )
    (define (len ls)
        (if (null? ls) 0 (+ 1 (len (cdr ls)))))

    (define (length ls)
        (if (null? ls) 0 (+ 1 (length (cdr ls)))))


    (define (gensym t) ;; Creates a brand new symbol that cannot be reused
        (unless (string? t) (error 'gensym "not a string"))
        (%make-gensym t))

    (define (list-all-eq? a b)
        (if (null? a)
            (null? b)
            (and (not (null? b))
                (eq? (car a) (car b))
                (list-all-eq? (cdr a) (cdr b))))))
