private primitives
tchdberrmsg: ecode
	^ self ffiCall: #(String tchdberrmsg(int ecode))