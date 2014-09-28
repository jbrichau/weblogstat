initialization
readLogs
	self initializeLogs.
	((FileSystem disk / '/Users/jbrichau/NextPlan/WeblogStat/logs/cgb') entries reject:[:e |  ('.*' match: e name)])
		do: [:entry | self processLog: (FileStream readOnlyFileNamed: entry fullName)]
		displayingProgress: [:entry| 'Processing ', entry name].