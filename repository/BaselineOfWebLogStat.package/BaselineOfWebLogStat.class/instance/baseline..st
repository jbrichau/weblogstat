as yet unclassified
baseline: spec
  <baseline>

  spec for: #common do: [
							
		spec		
			project: 'Seaside3' with: [
				spec
					className: 'ConfigurationOfSeaside3';
					versionString: #development;
					loads: #('REST' 'JQuery' 'JSON' 'Filesystem');
					repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ].
				
		spec		
			project: 'Rickshaw' with: [
				spec
					className: 'ConfigurationOfRickshaw';
					versionString: #development;
					repository: 'http://smalltalkhub.com/mc/emaringolo/rickshaw/main' ].
			
		spec		
			project: 'Bootstrap' with: [
				spec
					className: 'ConfigurationOfBootstrap';
					versionString: #stable;
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main' ].
			
		spec
		 	package: 'WebLogStat' with: [ 
				spec requires: #( 'Bootstrap' 'Seaside3' 'Rickshaw') ].
		spec
			group: 'default' with: #('WebLogStat').
		]