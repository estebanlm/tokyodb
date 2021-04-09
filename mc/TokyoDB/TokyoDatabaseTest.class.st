Class {
	#name : #TokyoDatabaseTest,
	#superclass : #TestCase,
	#category : 'TokyoDB-Tests'
}

{ #category : #testing }
TokyoDatabaseTest class >> isAbstract [
	^ self = TokyoDatabaseTest
]

{ #category : #accessing }
TokyoDatabaseTest class >> resources [
	^ { TokyoTestResource }
]

{ #category : #accessing }
TokyoDatabaseTest >> database [
	^ TokyoTestResource current databaseFor: self databaseClass
]

{ #category : #accessing }
TokyoDatabaseTest >> databaseClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
TokyoDatabaseTest >> databaseWith: aDictionary [
	| db |
	
	db := self database.
	aDictionary keysAndValuesDo: [ :key :value |
		db at: key put: value ].
	
	^ db 
]

{ #category : #tests }
TokyoDatabaseTest >> testAt [
	| db |
	
	db := self databaseWith: { 'TheAnswer' -> '42' } asDictionary.
	self assert: (db at: 'TheAnswer') equals: '42'

]

{ #category : #tests }
TokyoDatabaseTest >> testAtPut [
	| db |
	
	db := self database.
	db at: 'TheAnswer' put: '42'.
	self assert: (db at: 'TheAnswer') equals: '42'
]

{ #category : #tests }
TokyoDatabaseTest >> testKeysAndValuesDo [
	| db |

	db := self databaseWith: {
		'1'->'One'.
		'2'->'Two'.
		'3'->'Three' } 
		asDictionary.
		
	db keysAndValuesDo: [ :key :value | 
		self assert: (db at: key) = value ].

]

{ #category : #tests }
TokyoDatabaseTest >> testObjectAt [
	| db |
	
	db := self databaseWith: { 'TheAnswer' -> '42' } asDictionary.
	self assert: (db objectAt: 'TheAnswer') asString equals: '42'

]

{ #category : #tests }
TokyoDatabaseTest >> testObjectAtPut [
	| db |
	
	db := self database.
	db at: 'TheAnswer' putObject: '42' asByteArray size: 2.
	self assert: (db at: 'TheAnswer') equals: '42'
]
