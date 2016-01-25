tests
testObjectAt
	| db |
	
	db := self databaseWith: { 'TheAnswer' -> '42' } asDictionary.
	self assert: (db objectAt: 'TheAnswer') asString equals: '42'
