initialization
readLogs
	self initializeLogs.
	((FileDirectory on:'/Users/jbrichau/NextPlan/WeblogStat/logs/vgc') entries reject:[:e |  ('.*' match: e name)])
		do: [:entry | self processLog: (FileStream readOnlyFileNamed: entry fullName)]
		displayingProgress: [:entry| 'Processing ', entry name].