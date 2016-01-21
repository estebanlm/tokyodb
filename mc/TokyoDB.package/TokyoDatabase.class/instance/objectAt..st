accessing
objectAt: keyString
	^ self 
		objectAt: keyString 
		ifAbsent: [ self errorNoRec: keyString ]