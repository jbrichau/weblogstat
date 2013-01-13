initialization
initializeLogs
	Logs := OrderedCollection new.
	((FileDirectory on:'/Users/jbrichau/NextPlan/Monitoring/logs/orderflow') entries reject:[:e |  ('.*' match: e name)])
		do: [:entry | self processLog: (FileStream readOnlyFileNamed: entry fullName)]
		displayingProgress: [:entry| 'Processing ', entry name].