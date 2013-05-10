initialization
readLogs
	self initializeLogs.
	((FileDirectory on:'/Users/jbrichau/NextPlan/Monitoring/logs/vooruit') entries reject:[:e |  ('.*' match: e name)])
		do: [:entry | self processLog: (FileStream readOnlyFileNamed: entry fullName)]
		displayingProgress: [:entry| 'Processing ', entry name].