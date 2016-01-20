accessing
at: keyString ifAbsent: aBlock

	| result |
	result := self basicAt: keyString.
	result ifNil: aBlock.
	^ result