private
withErrorControlDo: aBlock 
	^ self 
		withErrorControlDo: aBlock 
		ifError: [ self error: self lastError ]