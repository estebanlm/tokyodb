instance creation
object: anExternalAddress size: aNumber
	^ self basicNew 
		initializeObject: anExternalAddress size: aNumber;
		yourself