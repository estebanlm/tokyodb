accessing
at: keyString
	^ self 
		at: keyString 
		ifAbsent: [ self errorNoRec: keyString ]