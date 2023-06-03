;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional code for explanation
(define (problem DLOG-2-2-2)
	(:domain driverlog)
	(:objects
		driver1 - driver         ; Object representing driver 1
		driver2 - driver         ; Object representing driver 2
		truck1 - truck           ; Object representing truck 1
		truck2 - truck           ; Object representing truck 2
		package1 - obj           ; Object representing package 1
		package2 - obj           ; Object representing package 2
		s0 - location            ; Object representing location s0
		s1 - location            ; Object representing location s1
		s2 - location            ; Object representing location s2
		p1-0 - location          ; Object representing location p1-0
		p1-2 - location          ; Object representing location p1-2
	)
	(:init
		(at driver1 s2)          ; Driver 1 is at location s2
		(at driver2 s2)          ; Driver 2 is at location s2
		(at truck1 s0)           ; Truck 1 is at location s0
		(empty truck1)           ; Truck 1 is empty
		(at truck2 s0)           ; Truck 2 is at location s0
		(empty truck2)           ; Truck 2 is empty
		(at package1 s0)         ; Package 1 is at location s0
		(at package2 s0)         ; Package 2 is at location s0
		(path s1 p1-0)           ; There is a path from s1 to p1-0
		(path p1-0 s1)           ; There is a path from p1-0 to s1
		(path s0 p1-0)           ; There is a path from s0 to p1-0
		(path p1-0 s0)           ; There is a path from p1-0 to s0
		(path s1 p1-2)           ; There is a path from s1 to p1-2
		(path p1-2 s1)           ; There is a path from p1-2 to s1
		(path s2 p1-2)           ; There is a path from s2 to p1-2
		(path p1-2 s2)           ; There is a path from p1-2 to s2
		(link s0 s1)             ; There is a link between s0 and s1
		(link s1 s0)             ; There is a link between s1 and s0
		(link s0 s2)             ; There is a link between s0 and s2
		(link s2 s0)             ; There is a link between s2 and s0
		(link s2 s1)             ; There is a link between s2 and s1
		(link s1 s2)             ; There is a link between s1 and s2
)
	(:goal (and
		(at driver1 s1)         ; Driver 1 is at location s1
		(at truck1 s1)          ; Truck 1 is at location s1
		(at package1 s0)        ; Package 1 is at location s0
		(at package2 s0)        ; Package 2 is at location s0
	))
)