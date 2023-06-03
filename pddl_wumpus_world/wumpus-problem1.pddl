(define (problem wumpus-problem1)
  (:domain wumpus-domain)

    ;; objects/ entities in planning problem
    ;; represented by cell locations
    ;; includes essential objects for program
    (:objects cell-1-1 cell-1-2 cell-1-3 cell-1-4 
                cell-2-1 cell-2-2 cell-2-3 cell-2-4 
                cell-3-1 cell-3-2 cell-3-3 cell-3-4
                cell-4-1 cell-4-2 cell-4-3 cell-4-4 
                final-gold final-arrow agent wumpus)

    ;; MAP
    ;; A = agent, P = pit, W = wumpus, G = gold
    ;;|---|---|---|---|
    ;;| A | P |   |   |
    ;;|---|---|---|---|
    ;;|   |   |   | P |
    ;;|---|---|---|---|
    ;;| P |   | W |   |
    ;;|---|---|---|---|
    ;;|   | G |   |   |
    ;;|---|---|---|---|

    ;; initial state
    (:init 
        (adj cell-1-1 cell-1-2) (adj cell-1-2 cell-1-1)
        (adj cell-1-1 cell-2-1) (adj cell-2-1 cell-1-1)
        (adj cell-1-2 cell-1-3) (adj cell-1-3 cell-1-2)
        (adj cell-1-2 cell-2-2) (adj cell-2-2 cell-1-2)
        (adj cell-1-3 cell-1-4) (adj cell-1-4 cell-1-3)
        (adj cell-1-3 cell-2-3) (adj cell-2-3 cell-1-3)
        (adj cell-1-4 cell-2-4) (adj cell-2-4 cell-1-4)
        
        (adj cell-2-1 cell-2-2) (adj cell-2-2 cell-2-1)
        (adj cell-2-1 cell-3-1) (adj cell-3-1 cell-2-1)
        (adj cell-2-2 cell-2-3) (adj cell-2-3 cell-2-2)
        (adj cell-2-2 cell-3-2) (adj cell-3-2 cell-2-2)
        (adj cell-2-3 cell-2-4) (adj cell-2-4 cell-2-3)
        (adj cell-2-3 cell-3-3) (adj cell-3-3 cell-2-3)
        (adj cell-2-4 cell-3-4) (adj cell-3-4 cell-2-4)

        (adj cell-3-1 cell-3-2) (adj cell-3-2 cell-3-1)
        (adj cell-3-1 cell-4-1) (adj cell-4-1 cell-3-1)
        (adj cell-3-2 cell-3-3) (adj cell-3-3 cell-3-2)
        (adj cell-3-2 cell-4-2) (adj cell-4-2 cell-3-2)
        (adj cell-3-3 cell-3-4) (adj cell-3-4 cell-3-3)
        (adj cell-3-3 cell-4-3) (adj cell-4-3 cell-3-3)
        (adj cell-3-4 cell-4-4) (adj cell-4-4 cell-3-4)
        
        (adj cell-4-1 cell-4-2) (adj cell-4-2 cell-4-1)
        (adj cell-4-2 cell-4-3) (adj cell-4-3 cell-4-2)
        (adj cell-4-3 cell-4-4) (adj cell-4-4 cell-4-3)
        
        ;; pit/s
        (pit cell-2-2)
        (pit cell-4-2)
        (pit cell-2-4)
        
        ;; gold
        (gold final-gold)
        (at final-gold cell-3-3)
        
        ;; agent
        (agent agent)
        (at agent cell-1-1)
        
        ;; object arrow
        (arrow final-arrow)
        (have agent final-arrow)
        
        ;; wumpus
        (wumpus wumpus)
        (at wumpus cell-3-1)
        (wumpus-location cell-3-1)
    )
    
    ;; goal state
    (:goal 
        (and 
            (have agent final-gold) 
            (at agent cell-1-1)
            (dead wumpus))
    )
)



