as yet unclassified
problemtimings
	<get>
	<path: '/problemtimings.json'>

	| anObject groupedByDate allDates firstdate lastdate series1 series2 all series3 series4 |
	
	groupedByDate := (Logs select:[:e | e time > 3]) groupedBy: [:entry | entry date].
	allDates := groupedByDate keys sorted:[:a :b | a <= b].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	series2 := OrderedCollection new.
	series3 := OrderedCollection new.
	series4 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			all := (groupedByDate at: aDate ifAbsent:[#()]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time < 5]) size; yourself).
			series2 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 5 and:[e time <= 10]]) size; yourself).
			series3 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 10 and:[e time <= 20]]) size; yourself).
			series4 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 20]) size; yourself).] .
	
	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: '3 - 5s'; at:'color' put: 'yellow';at: 'data' put: series1;yourself);
										add: (Dictionary new at: 'name' put: '5 - 10s'; at:'color' put: 'orange';at: 'data' put: series2;yourself);
										add: (Dictionary new at: 'name' put: '10 - 20s'; at:'color' put: 'red';at: 'data' put: series3;yourself);
										add: (Dictionary new at: 'name' put: '>20s'; at:'color' put: 'black';at: 'data' put: series4;yourself);
										yourself)]