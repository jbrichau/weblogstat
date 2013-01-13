rendering
updateRoot: aRoot

	aRoot javascript resourceUrl: '/js/jquery-1.7.1.min.js'.
	aRoot javascript resourceUrl: '/js/jquery-ui-1.8.18.min.js'.
	aRoot javascript resourceUrl: '/js/d3.min.js'.
	aRoot javascript resourceUrl: '/js/d3.layout.min.js'.
	aRoot javascript resourceUrl: '/js/rickshaw.min.js'.
	aRoot stylesheet resourceUrl: '/js/rickshaw.min.css'.
	aRoot addStyle:  '<style>
.chart_container {
	float: left;
        position: relative;
        font-family: Arial, Helvetica, sans-serif;
}
#chart1,#chart2 {
        display: inline-block;
        margin-left: 40px;
}
#y_axis1,#y_axis2 {
        position: relative;
	  float:left;
        top: 0;
        bottom: 0;
        width: 40px;
}
#legend1,#legend2 {
        display: inline-block;
        vertical-align: top;
        margin: 0 0 0 10px;
}
</style>'