private primitives
tchdbnew
	^ self ffiCall: #( TokyoHashDatabase tchdbnew ( void ) )