tests
testObjectAtPut
	| db |
	
	db := self database.
	db at: 'TheAnswer' putObject: '42' asByteArray size: 2.
	self assert: (db at: 'TheAnswer') equals: '42'