api
dayviewForDate: aDate
	<get>
	<path: '/dayview.json?date={aDate}'>

	| allSeries series |
	
	allSeries := EntriesPerDate at: (DateAndTime fromUnixTime: aDate asInteger) asDate.
	series := OrderedCollection new.
	allSeries keysAndValuesDo:[:sessionKey :sessionseries |
			series add: (Dictionary new 
									at: 'name' put: sessionKey; 
									at: 'data' put: (sessionseries collect:[:point | GRSmallDictionary new add: 'x'->point x; add:'y'->point y;yourself]);
									yourself)].

	self requestContext respond:[:response | 
			response stream json: series]