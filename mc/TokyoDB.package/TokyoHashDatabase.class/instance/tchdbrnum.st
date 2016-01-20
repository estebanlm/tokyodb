private primitives
tchdbrnum
	^ self ffiCall: #(uint64 tchdbrnum(self))