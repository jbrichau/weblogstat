private
processLog: aStream 
	[aStream atEnd] whileFalse:[ self processLogLine: (aStream upTo: Character lf) readStream].
	aStream close.