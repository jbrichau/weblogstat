as yet unclassified
timeouts
	<get>
	<path: '/timeouts.json'>

	|  allDates firstdate lastdate series1 all  |
	
	allDates := Timeouts keys sorted:[:a :b | a <= b].
	allDates isEmpty ifTrue:[self flag: 'hack'. self requestContext respond:[:response | response stream json: OrderedCollection new]. ^self].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			all := (Timeouts at: aDate ifAbsent:[0]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: all; yourself)] .
	
	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: 'timeout'; at:'color' put: 'red';at: 'data' put: series1;yourself);
										yourself)]