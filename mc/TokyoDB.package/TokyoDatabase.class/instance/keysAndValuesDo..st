enumerating
keysAndValuesDo: aBlock
	| key |
	
	self cursorInit.
	[ (key := self cursorNext) isNil ]
	whileFalse: [ aBlock value: key value: (self at: key) ]