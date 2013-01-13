rendering
renderContentOn: html
	html document addLoadScript: (self scriptToGenerateGraphOn: html).

html div
	class:'chart_container';
	with:[
		html div
			id: #y_axis1;
			with:''.
		html div 
			id: #chart1;
			with: ''.
		html div id: #legend1].
html div
	class: 'chart_container';
	with:[
	html div
			id: #y_axis2;
			with:''.
		html div 
			id: #chart2;
			with: ''.
		html div id: #legend2].
html div
	class: 'chart_container';
	with:[
	html div
			id: #y_axis3;
			with:''.
		html div 
			id: #chart3;
			with: ''.
		html div id: #legend3].