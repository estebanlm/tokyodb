accessing
objectAt: keyString ifAbsent: aBlock

	| result |
	result := self basicObjectAt: keyString.
	result ifNil: aBlock.
	^ result