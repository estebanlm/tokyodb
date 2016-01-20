private primitives
tchdbget2: kstr
	^ self ffiCall: #(void *tchdbget2(self, String kstr))