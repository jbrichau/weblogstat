register
register
	| app exceptionHandler |
	app := WAAdmin register: self at: '/data'.
	app addFilter: WAExceptionFilter new.
	app exceptionHandler: WAWalkbackErrorHandler