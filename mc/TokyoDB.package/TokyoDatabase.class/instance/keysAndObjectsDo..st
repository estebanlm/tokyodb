enumerating
keysAndObjectsDo: aBlock
	| key |
	
	self cursorInit.
	[ (key := self cursorNext) isNil ]
	whileFalse: [ aBlock value: key value: (self objectAt: key) ]