private
basicCursorNext
	| result value |
	result := self tchdbiternext2.
	result isNull ifFalse: [ 
		value := result fromCString.
		result free ].
	^ value 