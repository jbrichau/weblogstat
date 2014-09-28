as yet unclassified
renderGraph: aString id: anId on: html
	html heading; level:2; with: aString.
	html tbsRow: [ 
		html div class: 'chart_container'.
		html div id: 'y_axis',anId.
		html div id: 'chart', anId.
		html div id: 'legend', anId
	]