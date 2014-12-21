##WebLogStat

WebLogStat is a [Seaside Smalltalk](http://www.seaside.st) application to display webserver statistics of a Seaside webapp
when it sits behind a front-end webserver. It processes the log files of the front-end webserver 
(in the [Common Log File Format](http://en.wikipedia.org/wiki/Common_Log_Format)) to produce overview graphs.
Although it could be applied to analyze logs of any web application, it specifically targets Seaside applications with an
analysis of Seaside application sessions.

WebLogStat is currently under development and not ready for public use.

## How to install WebLogStat

* Download the last stable [Pharo Smalltalk](http://www.pharo-project.org).

* Load WebLogStat

```Smalltalk
	(Smalltalk at: #Metacello) new
		baseline: 'WebLogStat';
		repository: 'github://jbrichau/weblogstat/repository';
		load.
```

* Download the [Rickshaw](http://code.shutterstock.com/rickshaw/) js graphing library and its prerequisite js library [d3](http://www.d3js.org).

* Setup a Zinc http server using the Seaside control panel or execute:

```Smalltalk
ZnZincServerAdaptor startOn: 8080
```

*  Open the `webapp/index.html` file

## Dependencies

WebLogStat uses:
* Twitter Bootstrap (and its Seaside wrapper)
* Twitter Bootstrap
* [Rickshaw](http://code.shutterstock.com/rickshaw/) js graphing library (which requires [d3](http://www.d3js.org))

## Development
If you intend to develop, follow these steps:

* Load [FileTree](https://github.com/dalehenrich/filetree) in the Pharo image:

```Smalltalk
	Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: #'stable') load.
```