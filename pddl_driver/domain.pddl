;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional code for explanation
(define (domain driverlog)
  (:requirements :typing) 
  
  ;; define different types of objects in planning domain
  (:types         
      location locatable - object ;; location and object that can be located
		  driver truck obj - locatable ;; driver, truck and type of locatable object
  )
    
    ;; define state variables that present properties that hold true or false
    ;; in the problem domain
    (:predicates 
      (at ?obj - locatable ?loc - location)
      (in ?obj1 - obj ?obj - truck)
      (driving ?d - driver ?v - truck)
      (link ?x ?y - location) (path ?x ?y - location)
      (empty ?v - truck)
    )

    ;; define individual actions that can be performed in the planning domain
    (:action LOAD-TRUCK
      :parameters
      (?obj - obj ; object ot be loaded
      ?truck - truck ; truck to load object into
      ?loc - location) ;location where the object and truck are located
      :precondition
      (and 
        ;; truck and object is at the specified location
        (at ?truck ?loc) 
        ;; truck and object is at the specified location
        (at ?obj ?loc))
      :effect
      (and 
        ;; the object is no longer at the location
        (not (at ?obj ?loc)) 
        ;; the object is now in the truck
        (in ?obj ?truck)))

    ;; define individual actions that can be performed in the planning domain
    (:action UNLOAD-TRUCK
      :parameters
      (?obj - obj ; object to be unloaded
      ?truck - truck ; truck
      ?loc - location) ;location to unload object
      :precondition
      (and 
        ;; truck is at the specified location
        (at ?truck ?loc) 
        ;; object is in the truck
        (in ?obj ?truck))
      :effect
      (and 
        ;; object is no longer in the truck
        (not (in ?obj ?truck)) 
        ;; object is now at the specified location
        (at ?obj ?loc)))

    ;; define individual actions that can be performed in the planning domain
    (:action BOARD-TRUCK
    :parameters
    (?driver - driver ; driver
    ?truck - truck ; truck
    ?loc - location) ; location where truck is
    :precondition
    (and 
      ;; truck is at specified location
      (at ?truck ?loc) 
      ;; driver is at specified location
      (at ?driver ?loc) 
      ;; truck is empty
      (empty ?truck))
    :effect
    (and 
      ;; driver not at location
      (not (at ?driver ?loc)) 
      ;; driver is now driving truck
      (driving ?driver ?truck) 
      ;; truck is no longer empty
      (not (empty ?truck))))

    ;; define individual actions that can be performed in the planning domain
    (:action DISEMBARK-TRUCK
    :parameters
    (?driver - driver ; driver
    ?truck - truck ; truck
    ?loc - location) ; location
    :precondition
    (and 
      ;; truck is at the specified location
      (at ?truck ?loc) 
      ;; driver is driving the truck
      (driving ?driver ?truck))
    :effect
    (and 
      ;; driver is no longer driving the truck
      (not (driving ?driver ?truck)) 
      ;; driver is at the specified location
      (at ?driver ?loc) 
      ;; truck is now empty
      (empty ?truck)))

    ;; define individual actions that can be performed in the planning domain
    (:action DRIVE-TRUCK
    :parameters
    (?truck - truck ; truck
      ?loc-from - location ; starting location
      ?loc-to - location ; destination location
      ?driver - driver) ; driver
    :precondition
    (and 
      ;; truck is at starting location
      (at ?truck ?loc-from)
      ;; driver is driving truck
      (driving ?driver ?truck) 
      ;; there is a link between starting and destination locations
      (link ?loc-from ?loc-to))
    :effect
    (and 
      ;; truck no longer at starting location
      (not (at ?truck ?loc-from)) 
      ;; truck is now at destination location
      (at ?truck ?loc-to)))

    ;; define individual actions that can be performed in the planning domain
    (:action WALK
    :parameters
    (?driver - driver ; driver
    ?loc-from - location ; starting location
    ?loc-to - location) ; destination location
    :precondition
    (and 
      ;; driver is at starting location
      (at ?driver ?loc-from) 
      ;; there is a path from starting to destination location
      (path ?loc-from ?loc-to))
    :effect
    (and 
      ;; driver is no longer at the starting location
      (not (at ?driver ?loc-from)) 
      ;; driver is now at the destination location
      (at ?driver ?loc-to)))

      (:action LOAD-DRIVER
      :parameters
      (?driver - driver ; driver
      ?truck - truck ; truck
      ?loc - location) ; location
      :precondition
      (and 
        ;; truck is at the location
        (at ?truck ?loc) 
        ;; driver is at the location
        (at ?driver ?loc) 
        ;; truck is empty
        (empty ?truck))
      :effect
      (and 
        ;; driver is no longer at the location
        (not (at ?driver ?loc)) 
        ;; driver is now driving the truck
        (driving ?driver ?truck) 
        ;; truck is no longer empty
        (not (empty ?truck)))
    )
)

