;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional code for explanation
(define (problem DLOG-2-2-4)
	(:domain driverlog)
	(:objects
		driver1 - driver            ; Driver 1 object
		driver2 - driver            ; Driver 2 object
		truck1 - truck              ; Truck 1 object
		truck2 - truck              ; Truck 2 object
		package1 - obj              ; Package 1 object
		package2 - obj              ; Package 2 object
		package3 - obj              ; Package 3 object
		package4 - obj              ; Package 4 object
		s0 - location               ; Location s0 object
		s1 - location               ; Location s1 object
		s2 - location               ; Location s2 object
		p0-1 - location             ; Location p0-1 object
		p2-0 - location             ; Location p2-0 object
		p2-1 - location             ; Location p2-1 object
	)
	(:init
		(at driver1 s1)             ; Driver 1 is at location s1
		(at driver2 s0)             ; Driver 2 is at location s0
		(at truck1 s1)              ; Truck 1 is at location s1
		(empty truck1)              ; Truck 1 is empty
		(at truck2 s2)              ; Truck 2 is at location s2
		(empty truck2)              ; Truck 2 is empty
		(at package1 s0)            ; Package 1 is at location s0
		(at package2 s0)            ; Package 2 is at location s0
		(at package3 s1)            ; Package 3 is at location s1
		(at package4 s1)            ; Package 4 is at location s1
		(path s0 p0-1)              ; There is a path from s0 to p0-1
		(path p0-1 s0)              ; There is a path from p0-1 to s0
		(path s1 p0-1)              ; There is a path from s1 to p0-1
		(path p0-1 s1)              ; There is a path from p0-1 to s1
		(path s2 p2-0)              ; There is a path from s2 to p2-0
		(path p2-0 s2)              ; There is a path from p2-0 to s2
		(path s0 p2-0)              ; There is a path from s0 to p2-0
		(path p2-0 s0)              ; There is a path from p2-0 to s0
		(path s2 p2-1)              ; There is a path from s2 to p2-1
		(path p2-1 s2)              ; There is a path from p2-1 to s2
		(path s1 p2-1)              ; There is a path from s1 to p2-1
		(path p2-1 s1)              ; There is a path from p2-1 to s1
		(link s1 s0)                ; There is a link between s1 and s0
		(link s0 s1)                ; There is a link between s0 and s1
		(link s1 s2)                ; There is a link between s1 and s2
		(link s2 s1)                ; There is a link between s2 and s1
		(link s2 s0)                ; There is a link between s2 and s0
		(link s0 s2)                ; There is a link between s0 and s2
)
	(:goal (and
		(at driver2 s2)            ; Driver 2 is at location s2
		(at truck1 s1)             ; Truck 1 is at location s1
		(at truck2 s2)             ; Truck 2 is at location s2
		(at package1 s1)           ; Package 1 is at location s1
		(at package2 s1)           ; Package 2 is at location s1
		(at package3 s2)           ; Package 3 is at location s2
	))
)