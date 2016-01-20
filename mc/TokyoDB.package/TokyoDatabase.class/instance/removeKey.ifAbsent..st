accessing
removeKey: keyString ifAbsent: aBlock
	self 
		withErrorControlDo: [ self basicRemoveKey: keyString ]
		ifError: aBlock