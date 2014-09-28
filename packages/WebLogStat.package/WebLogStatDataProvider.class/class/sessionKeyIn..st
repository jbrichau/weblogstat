private
sessionKeyIn: aRequest
	| start end |
	start := aRequest indexOfSubCollection:'_s'.
	start = 0 ifTrue:[ ^ ''].
	end := aRequest indexOfAnyOf: '& ' startingAt: start.
	^ aRequest copyFrom: start to: end - 1.