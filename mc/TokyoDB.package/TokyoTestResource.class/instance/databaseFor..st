accessing
databaseFor: aClass
	^ database 
		at: aClass name 
		ifAbsentPut: [ self createAndOpenDatabase: aClass ]