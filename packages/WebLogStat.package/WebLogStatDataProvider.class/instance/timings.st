api
timings
	<get>
	<path: '/timings.json'>

	| anObject allDates firstdate lastdate summary series1 series2 series3 series4 |
	
	allDates := Timings keys sorted:[:a :b | a <= b].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	series2 := OrderedCollection new.
	series3 := OrderedCollection new.
	series4 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			summary := (Timings at: aDate ifAbsent:[Dictionary new]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series1 ifAbsent:[0]); yourself).
			series2 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series2 ifAbsent:[0]); yourself).
			series3 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series3 ifAbsent:[0]); yourself).
			series4 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (summary at: #series4 ifAbsent:[0]); yourself).] .

	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: 'Light speed (<300ms)'; at:'color' put: 'darkgreen';at: 'data' put: series1;yourself);
										add: (Dictionary new at: 'name' put: 'Subsecond (< 1s)'; at:'color' put: 'green';at: 'data' put: series2;yourself);
										add: (Dictionary new at: 'name' put: 'Acceptable (1-3s)'; at:'color' put: 'orange';at: 'data' put: series3;yourself);
										add: (Dictionary new at: 'name' put: 'Warning (>3s)'; at:'color' put: 'red';at: 'data' put: series4;yourself);
										yourself)]