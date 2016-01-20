tests
testAt
	| db |
	
	db := self databaseWith: { 'TheAnswer' -> '42' } asDictionary.
	self assert: (db at: 'TheAnswer') equals: '42'
