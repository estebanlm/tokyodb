private primitives
tchdbput2: kstr value: vstr
	^ self ffiCall: #(bool tchdbput2(self, String kstr, String vstr))