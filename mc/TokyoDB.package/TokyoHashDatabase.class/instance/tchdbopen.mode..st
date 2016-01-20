private primitives
tchdbopen: path mode: omode
	^ self ffiCall: #(bool tchdbopen(self, String path, int omode))