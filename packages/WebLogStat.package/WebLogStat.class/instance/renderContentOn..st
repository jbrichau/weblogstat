rendering
renderContentOn: html
	html document addLoadScript: (self scriptToGenerateGraphOn: html).
	
	html twbsContainer:[
		html heading
			level: 1;
			with: 'WebLogStat'.
		
		html heading
			level: 2;
			with: 'All Response Times'.

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
			
		html heading
			level: 2;
			with: 'Focus Slow Responses'.
	
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
			
		html heading
			level: 2;
			with: 'Cancelled Requests'.
		
		html div
			class: 'chart_container';
			with:[
				html div
					id: #y_axis3;
					with:''.
				html div 
					id: #chart3;
					with: ''.
				html div id: #legend3]].