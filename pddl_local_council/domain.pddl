;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional implementation of waste disposal logic
(define (domain collectionbins)
  (:requirements :typing) 
  
  (:types
    location locatable - object
    bot waste - locatable
    driver - bot
    factory - bot
  )
  
  (:predicates
        ;; indicates that an object is on a specific location
        (on ?obj - locatable ?loc - location)
    	;; indicates that a bot is holding a waste
    	(holding ?arm - locatable ?waste - locatable)
    	;; indicates that the bots arm is empty
        (arm-empty)
        ;; indicates the existence of a path between two locations
        (path ?location1 - location ?location2 - location)
        ;; has factory taken waste
        (collected ?waste - locatable)  ; new predicate
  )
;; define individual actions that can be performed in the planning domain
    (:action pick-up
        :parameters
         (?arm - bot
          ?waste - locatable
          ?loc - location)
        :precondition
         (and 
            ;; the bot is on the specified location
            (on ?arm ?loc) 
            ;; the waste is on the specified location
            (on ?waste ?loc)
            ;; the bots arm is empty
            (arm-empty)
          )
        :effect
         (and 
            ;; the waste is no longer on the location
            (not (on ?waste ?loc))
            ;; the bot is now holding the waste
            (holding ?arm ?waste)
            ;; the bots arm is no longer empty
            (not (arm-empty))
         )
    )
    
    ;; define individual actions that can be performed in the planning domain
    (:action drop
        :parameters
         (?arm - bot
          ?waste - locatable
          ?loc - location)
        :precondition
         (and 
            ;; the bot is on the specified location
            (on ?arm ?loc)
            ;; the bot is holding the waste
            (holding ?arm ?waste)
          )
        :effect
         (and 
            ;; the waste is now on the location
            (on ?waste ?loc)
            ;; the bots arm is empty
            (arm-empty)
            ;; the bot is no longer holding the waste
            (not (holding ?arm ?waste))
         )
    )
    
    ;; define individual actions that can be performed in the planning domain
    (:action move
        :parameters
         (?arm - bot
          ?from - location
          ?to - location)
        :precondition
         (and 
            ;; the bot is on the from location
            (on ?arm ?from) 
            ;; there is a path between the from and to locations
            (path ?from ?to)
         )
        :effect
         (and 
            ;; the bot is no longer on the from location
            (not (on ?arm ?from))
            ;; the bot is now on the to location
            (on ?arm ?to)
         )
    )
    ;; additional action for collection
    ;; define individual actions that can be performed in the planning domain
    (:action collect
        :parameters
        (?factory - factory
         ?waste - waste
         ?loc - location)
        :precondition
        (and
          (on ?factory ?loc)
          ;; check location of bin in ref to factory
          (on ?waste ?loc)
        )
        :effect
          (and 
            ;; has factory collected bin
            (collected ?waste)
            (not (on ?waste ?loc))
          )
    )
)

