private primitives
tchdbclose
	^ self ffiCall: #(bool tchdbclose(self))