as yet unclassified
disconnects
	<get>
	<path: '/disconnects.json'>

	| anObject groupedByDate allDates firstdate lastdate series1 series2 all series3 series4 |
	
	allDates := Disconnects keys sorted:[:a :b | a <= b].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			all := (Disconnects at: aDate ifAbsent:[0]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: all; yourself)] .
	
	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: '499'; at:'color' put: 'red';at: 'data' put: series1;yourself);
										yourself)]