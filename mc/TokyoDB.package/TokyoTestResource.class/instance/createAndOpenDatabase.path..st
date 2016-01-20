factory
createAndOpenDatabase: aClass path: aString
	^ aClass new 
		open: aString;
		yourself	