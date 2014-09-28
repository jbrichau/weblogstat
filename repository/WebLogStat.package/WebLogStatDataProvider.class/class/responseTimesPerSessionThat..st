visualizations
responseTimesPerSessionThat: aBlock
	| diag perSession|
	"self responseTimesPerSessionThat: [:s | s anySatisfy:[:e | (e attributeAt: #status) = '499']]"
	perSession := ((Logs groupedBy: [:e | e attributeAt: #sessionkey]) select:[:v | v size > 1]).
	(perSession select: aBlock) do:[:entries | 
		diag := ESDiagramRenderer new.
		(diag verticalBarDiagram)
			y: [:e | e attributeAt: #time];
			diagramTitle: (perSession keyAtValue: entries);
			regularAxis;
			width: 1200;
			height: 500;
			preferredAxisMaxY: 20;
			color:[:e | |v| ((e attributeAt: #status) = '499') ifTrue:[Color red] ifFalse:[v := (e attributeAt: #bytes). (v isNil or:[v isZero]) ifTrue:[Color gray: 0.80] ifFalse:[Color gray: (1/(v/1024) min: 0.8)]]];
			displayLegend: false;
			models: entries.
		
		diag interaction 
			strongHighlightWhenOver;
			popupText: [:e | e attributeAt: #datetime].
			
		diag interaction
			subscribe: ESMouseDown
			do: [ :object | object current entity inspect].

		diag open].