private
sessionKeyIn: aRequest
	|tokens|
	tokens := (aRequest findBetweenSubStrs: #('_s' '&')).
	^ tokens size > 1
		ifTrue:[tokens at: 2]
		ifFalse:['']