visualizations
responseTimes
	| diag |
	diag := ESDiagramRenderer new.
	(diag verticalBarDiagram)
		y: [:e | e attributeAt: #time];
		regularAxis;
		width: 1200;
		height: 500;
		preferredAxisMaxY: 35;
		setInvertedLinearFill;
		setColoredFill;
		models: self logs.
		
	diag interaction 
		strongHighlightWhenOver;
		popupText: [:e | e attributeAt: #datetime].
		
	diag interaction
			subscribe: ESMouseDown
			do: [ :object | object current entity inspect].

	^ diag open