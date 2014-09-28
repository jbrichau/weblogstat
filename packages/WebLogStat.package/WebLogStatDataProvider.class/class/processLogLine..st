private
processLogLine: aStream
	| ip datetime request status bytes referrer useragent requesttime upstreamtime entry |
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
	requesttime := aStream upTo: $". 
	aStream upTo: $".
	upstreamtime := aStream upTo: $". 
	entry := (LogEntry new 
		attributeAt: #datetime put: (self dateAndTimeFrom: datetime readStream);
		attributeAt: #sessionkey put: (self sessionKeyIn: request);
		attributeAt: #request put: request; 
		attributeAt: #status put: status;
		attributeAt: #bytes put: bytes asInteger;
		"attributeAt: #referrer put: referrer;"
		attributeAt: #useragent put: useragent;
		attributeAt: #time put: (ScaledDecimal readFrom: requesttime readStream);
		attributeAt: #line put: aStream contents;
		yourself).
	(upstreamtime = '' or:[upstreamtime = '-']) ifFalse:[
		entry attributeAt: #upstreamtime put: (ScaledDecimal readFrom: upstreamtime readStream)].
	self addEntry: entry.