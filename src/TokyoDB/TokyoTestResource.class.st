Class {
	#name : #TokyoTestResource,
	#superclass : #TestResource,
	#instVars : [
		'database'
	],
	#category : 'TokyoDB-Tests'
}

{ #category : #factory }
TokyoTestResource >> createAndOpenDatabase: aClass [
	^ self 
		createAndOpenDatabase: aClass 
		path: (self fileReferenceFor: aClass) fullName
]

{ #category : #factory }
TokyoTestResource >> createAndOpenDatabase: aClass path: aString [
	^ aClass new 
		open: aString;
		yourself	
]

{ #category : #accessing }
TokyoTestResource >> databaseFor: aClass [
	^ database 
		at: aClass name 
		ifAbsentPut: [ self createAndOpenDatabase: aClass ]
]

{ #category : #private }
TokyoTestResource >> fileReferenceFor: aClass [
	^ self fileReferenceForName: aClass name
]

{ #category : #private }
TokyoTestResource >> fileReferenceForName: aName [
	^ ('test.', aName, '.db') asFileReference
]

{ #category : #running }
TokyoTestResource >> setUp [
	database := Dictionary new
]

{ #category : #running }
TokyoTestResource >> tearDown [
	database keysAndValuesDo: [ :aName :db | 
		db close.
		(self fileReferenceForName: aName) ensureDelete ].
	
]
