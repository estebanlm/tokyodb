accessing
objectAt: keyString
	"Return the value at the given key, represented as a TokyoObject instance."
	^ self 
		objectAt: keyString 
		ifAbsent: [ self errorNoRec: keyString ]