;; reference https://github.com/fareskalaboud/LearnPDDL
;; additional code for explanation
(define (problem DLOG-2-2-3)
	(:domain driverlog)
	(:objects
		driver1 - driver          ; Object representing driver 1
		driver2 - driver          ; Object representing driver 2
		truck1 - truck            ; Object representing truck 1
		truck2 - truck            ; Object representing truck 2
		package1 - obj            ; Object representing package 1
		package2 - obj            ; Object representing package 2
		package3 - obj            ; Object representing package 3
		s0 - location             ; Object representing location s0
		s1 - location             ; Object representing location s1
		s2 - location             ; Object representing location s2
		p0-1 - location           ; Object representing location p0-1
		p0-2 - location           ; Object representing location p0-2
		p1-0 - location           ; Object representing location p1-0
		p2-1 - location           ; Object representing location p2-1
	)
	(:init
    (at driver1 s0)           ; Driver 1 is at location s0
    (at driver2 s0)           ; Driver 2 is at location s0
    (at truck1 s0)            ; Truck 1 is at location s0
    (empty truck1)            ; Truck 1 is empty
    (at truck2 s1)            ; Truck 2 is at location s1
    (empty truck2)            ; Truck 2 is empty
    (at package1 s2)          ; Package 1 is at location s2
    (at package2 s1)          ; Package 2 is at location s1
    (at package3 s1)          ; Package 3 is at location s1
    (path s0 p0-1)            ; There is a path from s0 to p0-1
    (path p0-1 s0)            ; There is a path from p0-1 to s0
    (path s1 p0-1)            ; There is a path from s1 to p0-1
    (path p0-1 s1)            ; There is a path from p0-1 to s1
    (path s0 p0-2)            ; There is a path from s0 to p0-2
    (path p0-2 s0)            ; There is a path from p0-2 to s0
    (path s2 p0-2)            ; There is a path from s2 to p0-2
    (path p0-2 s2)            ; There is a path from p0-2 to s2
    (path s2 p2-1)            ; There is a path from s2 to p2-1
    (path p2-1 s2)            ; There is a path from p2-1 to s2
    (path s1 p2-1)            ; There is a path from s1 to p2-1
    (path p2-1 s1)            ; There is a path from p2-1 to s1
    (link s0 s2)              ; There is a link between s0 and s2
    (link s2 s0)              ; There is a link between s2 and s0
    (link s1 s0)              ; There is a link between s1 and s0
	(link s0 s1)             ; There is a link between s0 and s1
	(link s1 s2)             ; There is a link between s1 and s2
	(link s2 s1)             ; There is a link between s2 and s1
)
	(:goal (and
  (at driver1 s1)         ; Driver 1 is at location s1
  (at driver2 s1)         ; Driver 2 is at location s1
  (at truck1 s2)          ; Truck 1 is at location s2
  (at truck2 s0)          ; Truck 2 is at location s0
  (at package1 s0)        ; Package 1 is at location s0
  (at package2 s2)        ; Package 2 is at location s2
  (at package3 s0)        ; Package 3 is at location s0
	))


)