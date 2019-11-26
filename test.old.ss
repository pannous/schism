; https://scheme.com/tspl4/
;https://stereobooster.github.io/schism/
; unused values not explicitly dropped by end of block ---
(library (pannous demo)
;Error: Scheme runtime error in char->integer: not a char == MISSING BRACE (()
    ;    Cannot read property 'index' of undefined => (and (fun1) (fun2)) !!

    (export fact test)
    (import (extensions) (rnrs) (rnrs mutable-pairs) (schism) (sets))
    (define (== a b) (eq? a b))
    (define (= a b) (eq? a b))

    (define (~= a b) (deep-eq? a b))
    (define (≈= a b) (deep-eq? a b))
    (define (±= a b) (deep-eq? a b))
    (define (¬= a b) (not (eq? a b)))
    (define (≠= a b) (not (eq? a b)))
    (define (var name)
            `(var . ,name)) ; `?? ,ok:unquote  (var 'a) => `(var . a)


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
;(define (var key val body)
;    (let ((key val)) (body))
;)


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
        ;        (if (equal? '() xs) 0 )
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


    ;    (define fibonacci
    ;        (lambda (n) (if (< n 2) 1 (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

    ;    (define a 12)
    (define (test)
        (let ((x 12) (y 13))
            ;            (set! x (111))
            (puts x)
            (puts y)
        )
        (puts '(1 2 3 4))
        (puts '(a b c d))
        (puts (Ω 1 2))
        (puts (Ω 1 2))

        (puts '(1 . 2))
        (puts (eq? (Ω 1 2) '(1 . 2))) ;#f?? why?

        (puts "OK")
        (puts (not 0)) ; f :(
        (puts (not 1)) ; f :(
        (puts (not #t)) ; f
        (puts (not #f)) ; t
        ;        (set! state (not state))

        ;        (define x 'a)
        ;        (list x x) ;<graphic> (a a)
        ;        (let ([x 'b])
        ;        (list x x)) ;<graphic> (b b)
        ;        (error 'test "all good")
        (puts 'YAY)
        (puts (fibonacci 10))
        (puts (null? 'hello))
        (puts (< 0 1)) ; #t
        ;        (puts (+ 1 2 3)); car: not a pair
        ;        (puts (+ (1 2 3))); car: not a pair
        (puts (+ (+ 2 -2) (+ 2 2)))
        (fact 5)
        ;        (hello)
        (puts (quote yay))
        (puts '(puts 'yay))
        ;        (puts (list-all-eq? (1 2) (1 2)))
        ;        (puts (listsadf))

        (puts (* 2 (* -2 (* 2 (* 2 2)))))
        (quote (1 2 3 4 5))
        (quote (puts 'yay))
        "OK" ;[String: 'sOK']
            '(1 2 3 4 5) ; Pair { car: 2,cdr: Pair { car: 4, cdr: Pair { car: 6, cdr: [Pair] } }} WTF
            'ok ;Ssok
        ;        eq?
        (puts #t) ; #t ;)
        (puts (number? 42)) ; #t yay
        (puts (eq? 1 2))
        (puts 'procedure?)
        (puts (procedure? test)) ; t
        ;        (puts (procedure? hell));  unbound identifier :(
        (puts (procedure? 'test)) ; f
        ;        (puts (pair? (1)))
        (puts (pair? '(1 2 3))) ; t
        (puts (pair? 'HI)) ; f


        ;        (puts (pair? (1 2 3)))
        ;        (puts (pair? 1 2 3))



        (puts "DONE")
        ;        number? 42
        ;        #t ; 0.5 type number LOL
        #f ; 0 type number
        ;        (car 1 2)

        ;        (+ 1 (car (1 2)))
        (cons 3 4) ; (3 . 4)
        (puts (cons 3 4)) ; (3 . 4)
        (puts '(1 2 3))

        ;        (write (3 4))
        ;        (print  (cons 3 4))
        (+ 1 (car (cons 3 4))) ; 4 OK
        (puts (list? '(a b c)))
        (puts (eq? 10 (fold-left (lambda (a b) (+ a b)) 0 '(1 2 3 4)))) ;t
        (puts (string=? "Mom and Dad" "mom and dad"))
        42
        ;        (puts (eval '(+ 1 2)))
        ;        (puts (concat "hi" "YOU"))
        (puts (Ω "hi" "YOU"))
        ;        (puts (concat "hi" "YOU"))
        (puts (concat '("hi" "YOU" "fool"))) ;//#NOPE


        ;        (puts ("hi" . "YOU")) ; NOPE
        (unless #f ; == IF NOT …
            (puts (sum '(1 2 3 4 5)))
        )
        (puts (has 3 '(1 2 3 4 5)))
        (puts (has '(1 2 3 4 5) 3))
        ;        (puts (in '(1 2 3 4 5) 3))
        (puts (if 1 2 3))
        ;        (puta (if 1 (2) (3)))

        ;        (puts (if (1) (2) (3)))

        ;        (if 1 (puts ("OK") 0))
        (puts (sum_BAD '(1 2 3 4 5)))
        (hello)
        ;        (put ,('(1 2 3))) unquote?
        (put "OK")
        (put 42)
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
        (~= (Ω 1 (Ω 2 3)) `(1 2 3))
;        (~= (Ω 1 (Ω 2 3)) ((Ω 1 2) . (Ω 2 3)))
;        ( . (Ω 1 2) (Ω 2 3)); invalid improper list
;        ( . (Ω 1 2) '(1 2 3)); invalid improper list
;        ( . '(1 2 3) '(1 2 3)); invalid improper list
        (do-test)
;(three)
        ;        (car '())
        ;        (car 0)

    )

)
