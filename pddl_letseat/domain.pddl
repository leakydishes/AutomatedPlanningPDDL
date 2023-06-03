;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional implementation of cupcake
;; additional implementation of unicorn
(define (domain letseat)
    (:requirements :typing) 
  
    ;; define different types of objects in planning domain
    (:types         
        location locatable - object
    	  bot cupcake - locatable
        robot - bot
        unicorn - bot
    )
  
    ;; define state variables that present properties that hold true or false
    ;; in the problem domain
    (:predicates
        ;; indicates that an object is on a specific location
    	  (on ?obj - locatable ?loc - location)
    	  ;; indicates that a bot is holding a cupcake
    	  (holding ?arm - locatable ?cupcake - locatable)
    	  ;; indicates that the bots arm is empty
        (arm-empty)
        ;; indicates the existence of a path between two locations
        (path ?location1 - location ?location2 - location)
        ;; has unicorn eaten cupcake
        (eaten ?cupcake - locatable)  ; new predicate
    )

    ;; define individual actions that can be performed in the planning domain
    (:action pick-up
        :parameters
         (?arm - bot
          ?cupcake - locatable
          ?loc - location)
        :precondition
         (and 
            ;; the bot is on the specified location
            (on ?arm ?loc) 
            ;; the cupcake is on the specified location
            (on ?cupcake ?loc)
            ;; the bots arm is empty
            (arm-empty)
          )
        :effect
         (and 
            ;; the cupcake is no longer on the location
            (not (on ?cupcake ?loc))
            ;; the bot is now holding the cupcake
            (holding ?arm ?cupcake)
            ;; the bots arm is no longer empty
            (not (arm-empty))
         )
    )
    
    ;; define individual actions that can be performed in the planning domain
    (:action drop
        :parameters
         (?arm - bot
          ?cupcake - locatable
          ?loc - location)
        :precondition
         (and 
            ;; the bot is on the specified location
            (on ?arm ?loc)
            ;; the bot is holding the cupcake
            (holding ?arm ?cupcake)
          )
        :effect
         (and 
            ;; the cupcake is now on the location
            (on ?cupcake ?loc)
            ;; the bots arm is empty
            (arm-empty)
            ;; the bot is no longer holding the cupcake
            (not (holding ?arm ?cupcake))
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
    
    ;; additional action for unicorn
    ;; define individual actions that can be performed in the planning domain
    (:action eat
        :parameters
        (?unicorn - unicorn
         ?cupcake - cupcake
         ?loc - location)
        :precondition
        (and
          (on ?unicorn ?loc)
          ;; check location of cupcake in ref to unicorn
          (on ?cupcake ?loc)
        )
        :effect
          (and 
            ;; has unicorn eat cupcake
            (eaten ?cupcake)
            (not (on ?cupcake ?loc))
          )
    )
)

