"
I'm a generic Tokyo database. 
I define the common API, but I'm abstract... my children implements real strategy.


"
Class {
	#name : #TokyoDatabase,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#pools : [
		'TokyoConstants'
	],
	#category : 'TokyoDB'
}

{ #category : #converting }
TokyoDatabase class >> asExternalTypeOn: gen [
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'library path' }
TokyoDatabase class >> ffiLibraryName [
	^ TokyoLibrary
]

{ #category : #finalization }
TokyoDatabase class >> finalizeResourceData: handle [
	self subclassResponsibility
]

{ #category : #'instance creation' }
TokyoDatabase class >> new [
	^ self subclassResponsibility
]

{ #category : #accessing }
TokyoDatabase class >> systemIcon [
	^ Smalltalk ui icons iconNamed: #collectionIcon
]

{ #category : #converting }
TokyoDatabase >> asDictionary [ 
	| dictionary |
	
	dictionary := Dictionary new: self size.
	self keysAndValuesDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{ #category : #accessing }
TokyoDatabase >> at: keyString [
	^ self 
		at: keyString 
		ifAbsent: [ self errorNoRec: keyString ]
]

{ #category : #accessing }
TokyoDatabase >> at: keyString ifAbsent: aBlock [
	| result |
	
	result := self basicAt: keyString.
	result ifNil: aBlock.
	^ result
]

{ #category : #accessing }
TokyoDatabase >> at: key ifAbsentPut: aBlock [ 
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ self at: key ifAbsent: [self at: key put: aBlock value]
]

{ #category : #accessing }
TokyoDatabase >> at: aKey ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer self."
	^ aBlock value: (self at: aKey ifAbsent: [ ^ self ])
]

{ #category : #accessing }
TokyoDatabase >> at: keyString put: valueString [ 
	self withErrorControlDo: [ self basicAt: keyString put: valueString  ] 
]

{ #category : #accessing }
TokyoDatabase >> at: keyString putObject: aByteArrayOrExternalAddress size: size [ 
	"Takes a ByteArray or ExternalAddress as an object representation"
	self withErrorControlDo: [ 
		self 
			basicAt: keyString 
			putObject: aByteArrayOrExternalAddress 
			size: size  ] 
]

{ #category : #accessing }
TokyoDatabase >> autoRelease [
	FFIExternalResourceManager addResource: self data: handle
]

{ #category : #private }
TokyoDatabase >> basicAt: keyString [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicAt: keyString put: valueString [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicAt: keyString putObject: aByteArrayOrExternalAddress size: size [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicClose [
	^ self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicCursorInit [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicCursorNext [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicErrorCode [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicErrorMessage: code [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicObjectAt: keyString [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicOpen: aString [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicOpenReadOnly: aString [
	self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> basicRemoveKey: keyString [
	self subclassResponsibility
]

{ #category : #'open/close' }
TokyoDatabase >> close [ 
	self withErrorControlDo: [ self basicClose ]
]

{ #category : #private }
TokyoDatabase >> cursorInit [
	self withErrorControlDo: [ self basicCursorInit ]
]

{ #category : #private }
TokyoDatabase >> cursorNext [
	^ self basicCursorNext
]

{ #category : #private }
TokyoDatabase >> errorNoRec: keyString [
	"If last error is ENOREC, then is not found. 
	 Otherwise is a general problem"
	self basicErrorCode = ENOREC
		ifTrue: [ NotFound signalFor: keyString ]
		ifFalse: [ self error: self lastError ] 
]

{ #category : #'library path' }
TokyoDatabase >> ffiLibraryName [
	^ TokyoLibrary
]

{ #category : #initialization }
TokyoDatabase >> initialize [
	super initialize. 
	self autoRelease
]

{ #category : #enumerating }
TokyoDatabase >> keysAndObjectsDo: aBlock [
	"Iterate collection and retrieve values as TokyoObject instances"
	| key |
	
	self cursorInit.
	[ (key := self cursorNext) isNil ]
	whileFalse: [ aBlock value: key value: (self objectAt: key) ]
]

{ #category : #enumerating }
TokyoDatabase >> keysAndValuesDo: aBlock [
	| key |
	
	self cursorInit.
	[ (key := self cursorNext) isNil ]
	whileFalse: [ aBlock value: key value: (self at: key) ]
]

{ #category : #accessing }
TokyoDatabase >> lastError [
	| code |
	code := self basicErrorCode.
	^ '{2} ({1})' format: { code. self basicErrorMessage: code }
]

{ #category : #accessing }
TokyoDatabase >> objectAt: keyString [
	"Return the value at the given key, represented as a TokyoObject instance."
	^ self 
		objectAt: keyString 
		ifAbsent: [ self errorNoRec: keyString ]
]

{ #category : #accessing }
TokyoDatabase >> objectAt: keyString ifAbsent: aBlock [
	"Return the value at the given key, represented as a TokyoObject instance."
	| result |
	result := self basicObjectAt: keyString.
	result ifNil: aBlock.
	^ result
]

{ #category : #accessing }
TokyoDatabase >> objectAt: key ifAbsentPut: aBlock [ 
	"Return the value at the given key, represented as a TokyoObject instance.
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ self objectAt: key ifAbsent: [self objectAt: key put: aBlock value]
]

{ #category : #accessing }
TokyoDatabase >> objectAt: aKey ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer self."
	^ aBlock value: (self objectAt: aKey ifAbsent: [ ^ self ])
]

{ #category : #'open/close' }
TokyoDatabase >> open: aString [ 
	self withErrorControlDo: [ self basicOpen: aString ]
]

{ #category : #'open/close' }
TokyoDatabase >> openReadOnly: aString [ 
	self withErrorControlDo: [ self basicOpenReadOnly: aString ]
]

{ #category : #accessing }
TokyoDatabase >> removeKey: keyString [ 
	^ self 
		removeKey: keyString 
		ifAbsent: [ self errorNoRec: keyString ]
]

{ #category : #accessing }
TokyoDatabase >> removeKey: keyString ifAbsent: aBlock [
	self 
		withErrorControlDo: [ self basicRemoveKey: keyString ]
		ifError: aBlock
]

{ #category : #accessing }
TokyoDatabase >> size [ 
	^ self subclassResponsibility
]

{ #category : #private }
TokyoDatabase >> withErrorControlDo: aBlock [ 
	^ self 
		withErrorControlDo: aBlock 
		ifError: [ self error: self lastError ]
]

{ #category : #private }
TokyoDatabase >> withErrorControlDo: aBlock ifError: errorBlock [
	| result |
	
	result := aBlock value.
	(result isNil or: [ result not ]) 
		ifTrue: [ ^ errorBlock value ].
	^ result
]
