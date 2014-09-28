api
problemtimings
	<get>
	<path: '/problemtimings.json'>

	| anObject allDates summary firstdate lastdate series1 series2 all series3 series4 |

	allDates := ProblemTimings keys sorted:[:a :b | a <= b].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	series2 := OrderedCollection new.
	series3 := OrderedCollection new.
	series4 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			summary := (ProblemTimings at: aDate ifAbsent:[Dictionary new]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series1 ifAbsent:[0]); yourself).
			series2 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series2 ifAbsent:[0]); yourself).
			series3 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series3 ifAbsent:[0]); yourself).
			series4 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series4 ifAbsent:[0]); yourself).] .
	
	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: '3 - 5s'; at:'color' put: 'yellow';at: 'data' put: series1;yourself);
										add: (Dictionary new at: 'name' put: '5 - 10s'; at:'color' put: 'orange';at: 'data' put: series2;yourself);
										add: (Dictionary new at: 'name' put: '10 - 20s'; at:'color' put: 'red';at: 'data' put: series3;yourself);
										add: (Dictionary new at: 'name' put: '>20s'; at:'color' put: 'black';at: 'data' put: series4;yourself);
										yourself)]