private primitives
tchdbout2: kstr
	^ self ffiCall: #(bool tchdbout2(self, String kstr))