factory
createAndOpenDatabase: aClass
	^ self 
		createAndOpenDatabase: aClass 
		path: (self fileReferenceFor: aClass) fullName