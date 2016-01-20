tests
testAtPut
	| db |
	
	db := self database.
	db at: 'TheAnswer' put: '42'.
	self assert: (db at: 'TheAnswer') equals: '42'