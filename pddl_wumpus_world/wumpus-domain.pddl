(define (domain wumpus-domain)
    ;; strips STRIPS (Stanford Research Institute Problem Solver)
    ;; strips actions have preconditions/ effects in logical conditions
    ;; :negative-preconditions allows negative preconditions in action definitions
  (:requirements :strips :negative-preconditions)
  ;; Define the predicates used in the domain
  (:predicates
    (at ?what ?cell) ; object is at a specific cell
    (adj ?cell-1 ?cell-2) ; cells are adjacent to each other
    (pit ?cell) ; pit is present at cell
    (wumpus-location ?cell) ; wumpus is in the cell
    (have ?who ?what) ; agent has an object
    (agent ?who) ; entity agent
    (wumpus ?who) ; entity Wumpus
    (arrow ?what) ; object arrow
    (gold ?what) ; object gold
    (dead ?who)) ; entity dead

    ;; move agent from one cell to the next
   (:action move
    :parameters (?who ?cell ?next-cell)
    :precondition (and 
                (agent ?who)
                (not (pit ?next-cell))
                (not (wumpus-location ?next-cell))
                (at ?who ?cell)
                (adj ?cell ?next-cell))
    :effect (and 
                (not (at ?who ?cell))
                (at ?who ?next-cell))
    )

    ;; agent grabs an object from the current cell
   (:action grab
    :parameters (?who ?what ?where)
    :precondition (and 
                (agent ?who)
                (at ?who ?where)
                (at ?what ?where))
    :effect (and 
                (have ?who ?what)
                (not (at ?what ?where)))
    )
    
    ;; agent shoots an arrow at wumpus
    (:action shoot
    :parameters (?who ?where ?with-arrow ?dead ?where-dead)
    :precondition (and 
                (agent ?who)
                (arrow ?with-arrow)
                (wumpus ?dead)
                (at ?dead ?where-dead)
                (adj ?where ?where-dead)
                (have ?who ?with-arrow)
                (at ?who ?where))
    :effect (and 
                (dead ?dead)
                (not (wumpus-location ?where-dead))
                (not (have ?who ?with-arrow)))
    )
)



