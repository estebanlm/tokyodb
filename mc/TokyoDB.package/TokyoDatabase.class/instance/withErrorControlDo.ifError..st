private
withErrorControlDo: aBlock ifError: errorBlock
	| result |
	
	result := aBlock value.
	(result isNil or: [ result not ]) 
		ifTrue: [ ^ errorBlock value ].
	^ result