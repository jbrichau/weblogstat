##WebLogStat

WebLogStat is a [Seaside Smalltalk](http://www.seaside.st) application to display webserver statistics of a Seaside webapp
when it sits behind a front-end webserver. It processes the log files of the front-end webserver 
(in the [Common Log File Format](http://en.wikipedia.org/wiki/Common_Log_Format)) to produce overview graphs.
Although it could be applied to analyze logs of any web application, it specifically targets Seaside applications with an
analysis of Seaside application sessions.

WebLogStat is currently under development and not ready for public use.

## How to install WebLogStat

* Download the last stable (Pharo)[http://www.pharo-project.org].

* Load FileTree:

```Smalltalk
	Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: #'stable') load.
```

* Load [Twitter Bootstrap](http://twitter.github.com/bootstrap/):

```Smalltalk
Gofer new
      url: 'http://ss3.gemstone.com/ss/TwitterBootstrap';
      package: 'ConfigurationOfTwitterBootstrap';
      load.
    (Smalltalk at: #ConfigurationOfTwitterBootstrap) project load.
```
The above step will automatically install Seaside 3.0.x.

* Download [Rickshaw](http://code.shutterstock.com/rickshaw/) and its prerequisite [d3](http://www.d3js.org).

* Load [Twitter Bootstrap](http://twitter.github.com/bootstrap/):

```Smalltalk
Gofer new
      url: 'http://ss3.gemstone.com/ss/TwitterBootstrap';
      package: 'ConfigurationOfTwitterBootstrap';
      load.
    (Smalltalk at: #ConfigurationOfTwitterBootstrap) project load.
```