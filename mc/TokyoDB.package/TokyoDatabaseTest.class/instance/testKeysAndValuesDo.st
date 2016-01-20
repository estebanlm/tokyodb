tests
testKeysAndValuesDo
	| db |

	db := self databaseWith: {
		'1'->'One'.
		'2'->'Two'.
		'3'->'Three' } 
		asDictionary.
		
	db keysAndValuesDo: [ :key :value | 
		self assert: (db at: key) = value ].
