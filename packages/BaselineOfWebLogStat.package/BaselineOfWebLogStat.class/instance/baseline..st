as yet unclassified
baseline: spec
  <baseline>

  spec for: #common do: [
							
		spec		
			project: 'Seaside30' with: [
				spec
					className: 'ConfigurationOfSeaside30';
					versionString: '3.0.7';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			
		spec		
			project: 'TwitterBootstrap' with: [
				spec
					className: 'ConfigurationOfTwitterBootstrap';
					versionString: #stable;
					repository: 'http://ss3.gemstone.com/ss/TwitterBootstrap' ].
			
		spec
		 	package: 'WebLogStat' with: [ 
				spec requires: #( 'TwitterBootstrap' 'Seaside30') ].
		spec
			group: 'default' with: #('WebLogStat').
		]