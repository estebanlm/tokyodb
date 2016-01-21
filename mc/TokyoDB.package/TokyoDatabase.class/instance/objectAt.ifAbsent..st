accessing
objectAt: keyString ifAbsent: aBlock
	"Return the value at the given key, represented as a TokyoObject instance."
	| result |
	result := self basicObjectAt: keyString.
	result ifNil: aBlock.
	^ result