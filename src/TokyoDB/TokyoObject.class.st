"
I'm an external tokyo object, as retrived in raw from database. 
When retrieving objects (other than strings) we need not just the object, but also the amount of space it takes in memory (to be able to do a memcpy, for example). 

I make sure user has all the information he needs.

You do not need to free resources, they are managed automatically, so don't worry about dispose.
"
Class {
	#name : #TokyoObject,
	#superclass : #Object,
	#instVars : [
		'object',
		'size'
	],
	#category : 'TokyoDB'
}

{ #category : #'instance creation' }
TokyoObject class >> new [
	self error: 'Use #object:size:'
]

{ #category : #'instance creation' }
TokyoObject class >> object: anExternalAddress size: aNumber [
	^ self basicNew 
		initializeObject: anExternalAddress size: aNumber;
		yourself
]

{ #category : #converting }
TokyoObject >> asByteArray [ 
	^ self object copyFrom: 1 to: self size
]

{ #category : #converting }
TokyoObject >> asString [
	^ self asByteArray asString
]

{ #category : #initialization }
TokyoObject >> initializeObject: anExternalAddress size: aNumber [
	self initialize.
	object := anExternalAddress.
	size := aNumber
]

{ #category : #accessing }
TokyoObject >> object [
	^ object
]

{ #category : #accessing }
TokyoObject >> size [
	^ size
]
