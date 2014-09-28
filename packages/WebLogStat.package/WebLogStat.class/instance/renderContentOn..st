as yet unclassified
renderContentOn: html
	html tbsContainer: [ 
		html heading; level: 1; with: 'Weblogstat'.
		self renderGraph: 'All Requests' id: 'all' on: html.
		
		 ]