as yet unclassified
baseline: spec
  <baseline>

  spec for: #common do: [
							
		spec		
			project: 'Seaside3' with: [
				spec
					className: 'ConfigurationOfSeaside3';
					versionString: #stable;
					loads: #('REST' 'JQuery' 'JSON' 'Filesystem' 'Zinc');
					repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ].
			
		spec		
			project: 'Bootstrap' with: [
				spec
					className: 'ConfigurationOfBootstrap';
					versionString: #stable;
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main' ].
			
		spec
		 	package: 'WebLogStat' with: [ 
				spec requires: #( 'Bootstrap' 'Seaside3') ].
		spec
			group: 'default' with: #('WebLogStat').
		]