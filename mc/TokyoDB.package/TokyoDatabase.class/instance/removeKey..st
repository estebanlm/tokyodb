accessing
removeKey: keyString 
	^ self 
		removeKey: keyString 
		ifAbsent: [ self errorNoRec: keyString ]