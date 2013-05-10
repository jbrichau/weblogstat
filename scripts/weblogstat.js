var ajaxGraph1 = new Rickshaw.Graph.Ajax( {
	renderer: 'bar',
	width: 800,
      height: 250,
	element: document.getElementById("chart1"),
	dataURL: ''data/timings.json'',
	onComplete: function(transport) {

var y_axis1 = new Rickshaw.Graph.Axis.Y( {
        graph: transport.graph,
        orientation: 'left',
	  tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
        element: document.getElementById(''y_axis1'')});
	y_axis1.render();
	var legend = new Rickshaw.Graph.Legend( {
	graph: transport.graph,
	element: document.getElementById('legend1')});
	var hoverDetail = new Rickshaw.Graph.HoverDetail( {
  		  graph: transport.graph,
  		  xFormatter: function(x) { return "date:"+ new Date(x*1000) },
   		 yFormatter: function(y) { return y + " requests" }
		})}
} );

var ajaxGraph2 = new Rickshaw.Graph.Ajax( {
	renderer: 'bar',
	width: 800,
      height: 250,
	element: document.getElementById("chart2"),
	dataURL: ''data/problemtimings.json'',
	onComplete: function(transport) {
	var x_axis2 = new Rickshaw.Graph.Axis.Time( { graph: transport.graph } );
var y_axis2 = new Rickshaw.Graph.Axis.Y( {
        graph: transport.graph,
        orientation: 'left',
        tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
        element: document.getElementById('y_axis2'),
} );
	y_axis2.render();
var legend = new Rickshaw.Graph.Legend( {
	graph: transport.graph,
	element: document.getElementById('legend2')

} );
	var hoverDetail = new Rickshaw.Graph.HoverDetail( {
  		  graph: transport.graph,
  		  xFormatter: function(x) { return "date:"+ new Date(x*1000) },
   		 yFormatter: function(y) { return y + " requests" }
		})}
} );

var ajaxGraph3 = new Rickshaw.Graph.Ajax( {
	renderer: 'bar',
	width: 800,
      height: 250,
	element: document.getElementById("chart3"),
	dataURL: ''data/disconnects.json'',
	onComplete: function(transport) {
	var x_axis3 = new Rickshaw.Graph.Axis.Time( { graph: transport.graph } );
var y_axis3 = new Rickshaw.Graph.Axis.Y( {
        graph: transport.graph,
        orientation: 'left',
        tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
        element: document.getElementById('y_axis3'),
} );
	y_axis3.render();
var legend = new Rickshaw.Graph.Legend( {
	graph: transport.graph,
	element: document.getElementById('legend3')

} );
	var hoverDetail = new Rickshaw.Graph.HoverDetail( {
  		  graph: transport.graph,
  		  xFormatter: function(x) { return "date:"+ new Date(x*1000) },
   		 yFormatter: function(y) { return y + " requests" }
		})}
} );


var ajaxGraph4 = new Rickshaw.Graph.Ajax( {
	renderer: 'bar',
	width: 800,
      height: 250,
	element: document.getElementById("chart4"),
	dataURL: 'data/apitimings.json',
	onComplete: function(transport) {
	var x_axis4 = new Rickshaw.Graph.Axis.Time( { graph: transport.graph } );
var y_axis4 = new Rickshaw.Graph.Axis.Y( {
        graph: transport.graph,
        orientation: 'left',
        tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
        element: document.getElementById('y_axis4'),
} );
	y_axis4.render();
var legend = new Rickshaw.Graph.Legend( {
	graph: transport.graph,
	element: document.getElementById('legend4')

} );
	var hoverDetail = new Rickshaw.Graph.HoverDetail( {
  		  graph: transport.graph,
  		  xFormatter: function(x) { return "date:"+ new Date(x*1000) },
   		 yFormatter: function(y) { return y + " requests" }
		})}
} );