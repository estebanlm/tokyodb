private primitives
tchdbput: kbuf size: ksiz value: vbuf valueSize: vsiz
	^ self ffiCall: #(bool tchdbput(self, const void *kbuf, int ksiz, const void *vbuf, int vsiz))