api
dayviewForDate: aDate
	<get>
	<path: '/dayview.json?date={aDate}'>

	| allSeries series |
	
	allSeries := EntriesPerDate at: (DateAndTime fromUnixTime: aDate asInteger) asDate.
	series := OrderedCollection new.
	allSeries keysAndValuesDo:[:sessionKey :entries | |thisseries|
			thisseries := (entries sorted: [:e1 :e2 | e1 datetime <= e2 datetime]) collect:[:entry | (Dictionary new at: 'x' put: entry datetime asUnixTime; at: 'y' put: ((entry time) * 1000) rounded; yourself)].
			series add: (Dictionary new at: 'name' put: sessionKey; at: 'data' put: thisseries;yourself)].

	self requestContext respond:[:response | 
			response stream json: series]