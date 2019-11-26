; https://scheme.com/tspl4/
;https://stereobooster.github.io/schism/
; unused values not explicitly dropped by end of block ---
(library (pannous demo)
    ;Error: Scheme runtime error in char->integer: not a char == MISSING BRACE (()
    ;    Cannot read property 'index' of undefined => (and (fun1) (fun2)) !!

    (export fact test)
    (import (extensions) (rnrs) (rnrs mutable-pairs) (schism) (schism compiler))

    ;    fetch
    (define (wrap x) (cons x '()))
    (define (== a b) (eq? a b))
    (define (= a b) (eq? a b))

    (define (~= a b) (deep-eq? a b))
    (define (≈= a b) (deep-eq? a b))
    (define (±= a b) (deep-eq? a b))
    (define (¬= a b) (not (eq? a b)))
    (define (≠= a b) (not (eq? a b)))
    ;    (define (~a b) (deep-eq? a b))
    ;    (define (¬a b) (not (eq? a b)))
    ;    (define (. a b) (cons a b)) NOP



    ;    (define (#1 xs) (car xs))
    ;    (define (#2 xs) (car (cdr xs)))
    (define (var name) `(var . ,name)) ; `!!!?? ,ok:unquote  (var 'a) => `(var . a)

    (define ($1 xs) (car xs))
    (define ($2 xs) (car (cdr xs)))
    (define (first xs) (car xs))
    (define (second xs) (car (cdr xs)))
    (define (^ xs) (car xs))
    (define (% xs) (cdr xs))
    (define ($ xs) (caddr xs))
    (define (rest xs) (cdr xs))
    (define (tail xs) (cdr xs))
    (define (last xs) (caddr xs))


    ;(rnrs base), (rnrs) standard Scheme
    (define (has x xs)
        (if (pair? xs)
            (if (null? xs) #f (or (== x (car xs)) (has x (cdr xs))))
            (if (pair? x) (has xs x) #f)
        )
    )

    (define (fact n)
        (if (zero? n) 1 (* n (fact (- n 1))))
    )

    (define (sum_BAD xs)
        (if (null? xs) 0
            (if (pair? xs)
                (+ (car xs) (sum (cdr xs)))
                xs
            )
        )
    )

    ;    variadic function
    ;    (define (procedure . args) NOPE

    (define (fibonacci n)
        (if (< n 2) 1 (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
    )


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
                            '())))
    )
    (define (长 v) (length v))
    (define (说 x) (put x))
    ;定义 [定義] dìngyì



    (define (go a.b) ; a.b just a name?
        (puts `(,a.b)) ; OK SOMETHING is working here
        (puts `dfa) ;  INTERESTING  just like quote, BUT
        (puts `a.b) ; INTERESTING a.b WHY: ?
        (put `(1 2 3)) ; INTERESTING 1,2,3,
        (put '(1 2 3)) ; INTERESTING 1,2,3,
        (puts a.b)
        (puts (car a.b))
        ;    (puts (,a.b))

    )

    ;    (define a 12)
    (define (test)
        (puts (长 '(1 2 3)))

        (go (Ω 1 2))
        ;        (go (1.2))
        ;        (go 'a.%LKJHOIUYå ∂ƒ&.b)


        ;            (set! x (111))
        (let ((x 12) (y 13))
            (puts x)
            (puts y)
            (puts x)
        )
        (put (Ω 1 2))
        ;        (puta (Ω 1 2));not a pair
        (put '(1 2 3 4 5))
        (var 'a)
        (put (^ '(1 2 3 4 5)))
        (put (% '(1 2 3 4 5)))
        (put ($ '(1 2 3 4 5)))
        (put `(1 2 3 4 5))
        (put `(1 2 3 4 5))
        (put '(1 2 3 4 5))
        (put '(1 2 3 4 5))
        ;        (put put) ;#<procedure>
        ;        (write #put); ut !
        ;        (write #p1)
        (puta '(1 2 3 4 5))
        (newline) ; FLUSH AT END!!
            'ok
        (Ω 1 2) ; Pair { car: 2, cdr: 4 }
        (pair? (Ω 1 2))
        (pair? '(1 2))
        (~= '(1 2) (Ω 1 2))
        (put (Ω 1 (Ω 2 3)))
        ;        (put (1 . 2))
        (puts (~= (Ω 1 (Ω 2 3)) `(1 2 3))) ;f
        (puts (~= (Ω 1 (Ω 2 3)) '(1 2 3))) ;f

        ;        (~= (Ω 1 (Ω 2 3)) ((Ω 1 2) . (Ω 2 3)))
        ;        ( . (Ω 1 2) (Ω 2 3)); invalid improper list
        ;        ( . (Ω 1 2) '(1 2 3)); invalid improper list
        ;        ( . '(1 2 3) '(1 2 3)); invalid improper list
        (do-test)
        (var 'a)
        (var 1)
        (put 'a)
        (puts (wrap 1))
        ;        (puts (1)); function signature mismatch
        (º) ; null ++
        ;        ø ; result Closure { index: 503, env: [] } !
        put ; result Closure { index: 503, env: [] } !  POINTERS
        ;        (car '()) ;  not a pair
        ;        (car 1) ; not a pair
        1 ; true  via js
        0 ; false via js
        #x7d ;        0x7d 125
;        (read-library-from-file "./schism/compiler.ss")
;        (read-library-from-file "./scheme-lib/extensions.ss")
        ;        hallo
        ;        (hallo)
        ;        (put (read-library-from-file "./schism/compiler.ss")) ; WOW WORKS!!
        ;        (compile-library (map integer->char '(1 2 3)))
;        TODO reset %write-char
    (write-bytes (compile-library '(library (test) (export teeeeest) (import (rnrs)) (define (teeeeest) 42)))); OMFG!!
        ;                (compile-test '(library test))
    )
    (define (º) '())
    (define (null) '())
    (define (ø) '())
    ;    (define ø '())


    (define (read-library-from-file filename)
        (%open-as-stdin filename)
        (read))

    (define (compile-test lisp)
        (write-bytes ; to test.wasm
            (compile-library lisp))
    )

)
