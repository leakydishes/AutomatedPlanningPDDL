;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional implementation of waste disposal logic
(define (problem collectionbins-simple)
	(:domain collectionbins)
  (:objects
        arm - driver ; robot arm
        waste - waste ; waste object
        bin - location ; location represent start/ bin
        factory - factory ; factory object
        factorydeposit - location ; location representing factory
  )
  (:init
    (on arm bin) ; arm is on the bin
    (on waste bin) ; waste is on the bin
    (on factory factorydeposit)  ; factory is on the factorydeposit
    (arm-empty) ; arm is empty
    (path bin factorydeposit) ; path exists between bin and factorydeposit
  )
  (:goal
    (and
        (on waste factorydeposit)
    )
  )
)
