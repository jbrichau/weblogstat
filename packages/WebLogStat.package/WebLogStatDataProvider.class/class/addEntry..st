private
addEntry: anEntry 
	| summary |
	(self isValidEntry: anEntry) ifFalse:[^ self].
	(self isResourceEntry: anEntry) ifTrue:["anEntry timediff > 2 ifTrue:[Transcript show: anEntry line;cr]." ^ self].

	summary := Timings at: anEntry date ifAbsentPut:[Dictionary new].
	anEntry time <= 0.300 ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
	(anEntry time > 0.300 and:[anEntry time <= 1]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].
	(anEntry time > 1 and:[anEntry time <= 3]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
	(anEntry time > 3) ifTrue:[summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].
	
	summary := ProblemTimings at: anEntry date ifAbsentPut:[Dictionary new].
	(anEntry time > 3 and:[anEntry time < 5]) ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
	((anEntry time > 5) and:[anEntry time <= 10]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].	
	((anEntry time > 10) and:[anEntry time <= 20]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
	(anEntry time > 20) ifTrue:[summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].
	
	(anEntry time > 55) ifTrue:[Timeouts at: anEntry date put: (Timeouts at: anEntry date ifAbsent:[0]) + 1].
	
	summary := InteractiveTimings at: anEntry date ifAbsentPut:[Dictionary new].
	((anEntry request includesSubstring: '/repapi') or:[anEntry request includesSubstring: '/api']) ifFalse:[
			anEntry time <= 0.300 ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
			(anEntry time > 0.300 and:[anEntry time <= 1]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].
			(anEntry time > 1 and:[anEntry time <= 3]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
			(anEntry time > 3) ifTrue:["anEntry timediff > 2 ifTrue:[Transcript show: anEntry line;cr]." summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].].	

	summary := APITimings at: anEntry date ifAbsentPut:[Dictionary new].
	(anEntry request includesSubstring: '/api') ifTrue:[
			anEntry time <= 0.300 ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
			(anEntry time > 0.300 and:[anEntry time <= 1]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].
			(anEntry time > 1 and:[anEntry time <= 3]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
			(anEntry time > 3) ifTrue:[summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].].	
			
	summary := RepAPITimings at: anEntry date ifAbsentPut:[Dictionary new].
	(anEntry request includesSubstring: '/repapi') ifTrue:[
			anEntry time <= 0.300 ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
			(anEntry time > 0.300 and:[anEntry time <= 1]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].
			(anEntry time > 1 and:[anEntry time <= 3]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
			(anEntry time > 3) ifTrue:[summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].].
		
	summary := SlowConnectionTimings at: anEntry date ifAbsentPut:[Dictionary new].
			anEntry timediff <= 1 ifTrue:[summary at: #series1 put: (summary at: #series1 ifAbsent:[0]) + 1].
			(anEntry timediff > 1 and:[anEntry time <= 3]) ifTrue:[summary at: #series2 put: (summary at: #series2 ifAbsent:[0]) + 1].
			(anEntry timediff > 3 and:[anEntry time <= 5]) ifTrue:[summary at: #series3 put: (summary at: #series3 ifAbsent:[0]) + 1].
			(anEntry timediff > 5) ifTrue:[summary at: #series4 put: (summary at: #series4 ifAbsent:[0]) + 1].

	(anEntry attributeAt: #status) = '499' ifTrue:[
		Disconnects at: anEntry date put: (Disconnects at: anEntry date ifAbsent:[0]) + 1]