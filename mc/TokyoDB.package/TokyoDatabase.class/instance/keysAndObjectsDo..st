enumerating
keysAndObjectsDo: aBlock
	"Iterate collection and retrieve values as TokyoObject instances"
	| key |
	
	self cursorInit.
	[ (key := self cursorNext) isNil ]
	whileFalse: [ aBlock value: key value: (self objectAt: key) ]