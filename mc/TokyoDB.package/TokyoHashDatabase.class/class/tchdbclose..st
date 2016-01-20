private primitives
tchdbclose: handle
	^ self ffiCall: #(bool tchdbclose(void *handle))
