private
basicAt: keyString
	| result value |
	
	result := self tchdbget2: keyString.
	result isNull ifFalse: [ 
		value := result fromCString.
		result free ].
	
	^ value