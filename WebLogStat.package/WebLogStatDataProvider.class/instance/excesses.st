as yet unclassified
excesses

Transcript show: (String streamContents: [ :stream | 
	(self logs select: [ :l | (l attributeAt: #time) > 10 ]) 
		do: [ :l |  | sessions otherlogs | 
			sessions := OrderedCollection new.
			otherlogs := (self logs select: [ :l2 | ((l2 attributeAt: #datetime) hour = (l attributeAt: #datetime) hour) and: [  ((l2 attributeAt: #datetime) minute = (l attributeAt: #datetime) minute) ]]).
			otherlogs do: [ :l2 | | sindex sindex2 request  |  
								request := l2 attributeAt: #request.
								sindex := request findString: '_s='. 
								sindex2 := (request findString: '&' startingAt: sindex).
								(sindex2 == 0) ifTrue: [ sindex2 := (request findString: ' ' startingAt: sindex)].
								(sindex > 0)  ifTrue: [sessions add: (request copyFrom: sindex+3 to: sindex2 - 1). ]].
			stream nextPutAll: (l attributeAt: #datetime) asString, ' :: ', 
				(l attributeAt: #time) asString, ' :: ', (((l attributeAt: #request) includesSubString: '/api') ifTrue: [ 'api*' ] ifFalse: [ '' ]), ' :: ', 
				otherlogs size asString, ' req/min', ' :: ', sessions asSet size asString, ' sessions'; cr.  ] ])
