accessing
databaseWith: aDictionary
	| db |
	
	db := self database.
	aDictionary keysAndValuesDo: [ :key :value |
		db at: key put: value ].
	
	^ db 