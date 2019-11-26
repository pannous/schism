; https://scheme.com/tspl4/
;https://stereobooster.github.io/schism/
; unused values not explicitly dropped by end of block ---
(library (pannous demo)
    (export fact test)
    (import (extensions) (rnrs) (rnrs mutable-pairs) (schism))

    ;    (define f
    ;        (lambda (x)
    ;            (+ x 1))
    ;    )
    (define (list a b)
        (a b)
    )

;    variadic function
;    (define (procedure . args) NOPE

;    NO NEED, but why fucks up??
    (define (puta xs)
        (if (pair? xs)
            (
                (write (car xs))
                (write " ")
                (puta (cdr xs))
            )
            (puts "DONE")
;            ((puts "DONE"))
        )
    )



    (define (test)
    ;    (define fibonacci
    ;        (lambda (n) (if (< n 2) 1 (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

    ;    (define a 12)
            ;            (set! x (111))
;        (puta '(1 2 3 4))
        (puts (eq? (∑ 1 2) '(1 . 2))) ;#f?? why?
;        ¿Ω≈ç√∫∫ñµ≤≥÷æ…¬˙∆°©ƒ∂ßåœ∑®'é†¥üîøπ“≠±-–—
        ;        (puts (sum '(1 2 3 4)))
        (puts (not 0)) ; f :(
        (puts (not 1)) ; f :(
        ;        (set! state (not state))
        ;        (define x 'a)
        ;        (list x x) ;<graphic> (a a)
        ;        (let ([x 'b])
        ;        (list x x)) ;<graphic> (b b)
        ;        (error 'test "all good")
        ;        (puts (+ 1 2 3)); car: not a pair
        ;        (puts (+ (1 2 3))); car: not a pair
        ;        (hello)
        ;        (puts (list-all-eq? (1 2) (1 2)))
        ;        (puts (listsadf))
            '(1 2 3 4 5) ; Pair { car: 2,cdr: Pair { car: 4, cdr: Pair { car: 6, cdr: [Pair] } }} WTF
            'ok ;Ssok
        (puts (procedure? test)) ; t
        ;        (puts (procedure? hell));  unbound identifier :(
        (puts (procedure? 'test)) ; f
        ;        (puts (pair? (1)))
        (puts (pair? 'HI)) ; f
        ;        (puts (pair? (1 2 3)))
        ;        (puts (pair? 1 2 3))
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
    )

    ; BAD:
    ;        (car (1 2))
    ;(cdr (1 2))
    ;        '(cons 'a '(b c))
    ;        (cons 1 (2 3)) ; (1 2 3)
    ;        (#t) ; function signature mismatch
    ;                (list (1 2 3 4 5)); car: not a pair
    ;                (list 1 2); signature mismatch
    ;                (list (1 2)); signature mismatch
    ;                (liste (1 2 3)); signature mismatch

    ;        2.2 BUG float
    ;        (/ 2 2) BUG division!
    ;        (- 2 (* 4 1/3)) BUG division!
    ;        (/ (* 6/7 7/2) (- 4.5 1.5)) BUG


;                 (lambda (z*)
;                   (conj*
;                    `(,(conso hd tl x)
;                      ,(conso hd z* z)
;                      ,(appendo tl y z*)
)
