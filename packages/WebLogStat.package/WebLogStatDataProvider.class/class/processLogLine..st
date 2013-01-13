private
processLogLine: aStream
	| ip datetime request status bytes referrer useragent time |
	ip := aStream upTo: Character space.
	aStream upTo: $[.
	datetime := aStream upTo: $].
	aStream upTo: $".
	request := aStream upTo: $".
	aStream next.
	status := aStream upTo: Character space.
	aStream next.
	bytes :=  aStream upTo: Character space.
	aStream upTo: $".
	referrer := aStream upTo: $".
	aStream upTo: $".
	useragent := aStream upTo: $".
	aStream upTo: $".
	time := aStream upTo: $".
	self addEntry: (LogEntry new 
		attributeAt: #datetime put: (self dateAndTimeFrom: datetime readStream);
		attributeAt: #sessionkey put: (self sessionKeyIn: request);
		attributeAt: #status put: status;
		attributeAt: #bytes put: bytes asInteger;
		attributeAt: #referrer put: referrer;
		attributeAt: #useragent put: useragent;
		attributeAt: #time put: (Float readFrom: time readStream);
		yourself).