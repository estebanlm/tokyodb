private primitives
tchdbget: kbuf size: ksiz resultSize: sp
	^ self ffiCall: #(void *tchdbget(self, const void *kbuf, int ksiz, int *sp))