as yet unclassified
timings
	<get>
	<path: '/timings.json'>

	| anObject groupedByDate allDates firstdate lastdate series1 series2 all series3 series4 |
	
	groupedByDate := Logs groupedBy: [:entry | entry date].
	allDates := groupedByDate keys sorted:[:a :b | a <= b].
	firstdate := allDates first.
	lastdate := allDates last.
	series1 := OrderedCollection new.
	series2 := OrderedCollection new.
	series3 := OrderedCollection new.
	series4 := OrderedCollection new.
	(firstdate to: lastdate) dates doWithIndex:[:aDate :index |
			all := (groupedByDate at: aDate ifAbsent:[#()]).
			series1 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time <= 0.300]) size; yourself).
			series2 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 0.300 and:[e time <= 1]]) size; yourself).
			series3 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 1 and:[e time <= 3]]) size; yourself).
			series4 add: (Dictionary new at: 'x' put: aDate asDateAndTime asUnixTime; at: 'y' put: (all select:[:e | e time > 3]) size; yourself).] .
	
	self requestContext respond:[:response | 
			response stream json: (OrderedCollection new 
										add: (Dictionary new at: 'name' put: 'Light speed (<300ms)'; at:'color' put: 'darkgreen';at: 'data' put: series1;yourself);
										add: (Dictionary new at: 'name' put: 'Subsecond (< 1s)'; at:'color' put: 'green';at: 'data' put: series2;yourself);
										add: (Dictionary new at: 'name' put: 'Acceptable (1-3s)'; at:'color' put: 'orange';at: 'data' put: series3;yourself);
										add: (Dictionary new at: 'name' put: 'Warning (>3s)'; at:'color' put: 'red';at: 'data' put: series4;yourself);
										yourself)]