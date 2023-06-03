;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional implementation of cupcake
;; additional implementation of unicorn
(define (problem letseat-simple)
    (:domain letseat)
    (:objects
        arm - robot ; robot arm
        cupcake1 - cupcake ; first cupcake object
        cupcake2 - cupcake ; second cupcake object
        unicorn - unicorn  ; unicorn object
        table - location ; location representing the table
        plate - location ; location representing the plate
    )

    ;; initial state
    (:init
        (on arm table) ; arm is on the table
        (on cupcake1 table) ; cupcake1 is on the table
        (on cupcake2 table) ; cupcake2 is on the table
        (on unicorn plate)  ; unicorn is on the table
        (arm-empty) ; arm is empty
        (path table plate) ; path exists between table and plate
        ; (path unicorn cupcake1) ; path exists between table and plate
    )
    
    ;; goal state   
    (:goal
        (and
			;; unicorn is at plate, action eaten moves cupcake to unicorns location
			;; then eats cupcake 1
			(eaten cupcake1)  ; unicorn has eaten the first cupcake
        )
    )
)