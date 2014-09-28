convenience
timediff
	self upstreamtime ifNil:[^ 0].
	^ self time - self upstreamtime