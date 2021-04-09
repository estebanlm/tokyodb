"
I'm a hash table database.

Hash database is a file containing a hash table and is handled with the hash database API. See `tchdb.h' for the entire specification.

Before operations to store or retrieve records, it is necessary to open a database file and connect the hash database object to it.  ==open:== used to open a database file and the ==close== is used to close the database file. 

To avoid data missing or corruption, it is important to close every database file when it is no longer in use. It is forbidden for multible database objects in a process to open the same database at the same time.
"
Class {
	#name : #TokyoHashDatabase,
	#superclass : #TokyoDatabase,
	#pools : [
		'TokyoHashConstants'
	],
	#category : 'TokyoDB'
}

{ #category : #finalization }
TokyoHashDatabase class >> finalizeResourceData: handle [
	"I get sure DB is closed before freeing"
	self tchdbclose: handle.
	"Now we can free the resource"
	self tchdbdel: handle
]

{ #category : #'instance creation' }
TokyoHashDatabase class >> new [
	^ self tchdbnew initialize
]

{ #category : #'private primitives' }
TokyoHashDatabase class >> tchdbclose: handle [
	^ self ffiCall: #(bool tchdbclose(void *handle))

]

{ #category : #'private primitives' }
TokyoHashDatabase class >> tchdbdel: hdb [
	^ self ffiCall: #( void tchdbdel ( void *hdb ) )
]

{ #category : #'private primitives' }
TokyoHashDatabase class >> tchdbnew [
	^ self ffiCall: #( TokyoHashDatabase tchdbnew ( void ) )
]

{ #category : #private }
TokyoHashDatabase >> basicAt: keyString [
	| result value |
	
	result := self tchdbget2: keyString.
	result isNull ifFalse: [ 
		value := result fromCString.
		result free ].
	
	^ value
]

{ #category : #private }
TokyoHashDatabase >> basicAt: keyString put: valueString [
	^ self tchdbput2: keyString value: valueString
]

{ #category : #private }
TokyoHashDatabase >> basicAt: keyString putObject: aByteArrayOrExternalAddress size: size [

	^ self 
		tchdbput: keyString asByteArray
		size: keyString size 
		value: aByteArrayOrExternalAddress
		valueSize: size
]

{ #category : #private }
TokyoHashDatabase >> basicClose [
	^ self tchdbclose
]

{ #category : #private }
TokyoHashDatabase >> basicCursorInit [
	^ self tchdbiterinit
]

{ #category : #private }
TokyoHashDatabase >> basicCursorNext [
	| result value |
	result := self tchdbiternext2.
	result isNull ifFalse: [ 
		value := result fromCString.
		result free ].
	^ value 
]

{ #category : #private }
TokyoHashDatabase >> basicErrorCode [
	^ self tchdbecode
]

{ #category : #private }
TokyoHashDatabase >> basicErrorMessage: code [
	^ self tchdberrmsg: code
]

{ #category : #private }
TokyoHashDatabase >> basicObjectAt: keyString [
	| result buffer |
	
	buffer := ByteArray new: (FFIExternalType sizeOf: #int).
	result := self tchdbget: keyString size: keyString size resultSize: buffer.
	result isNull ifTrue: [ ^ nil ].
	result autoRelease.
	^ TokyoObject object: result size: (buffer signedLongAt: 1)
]

{ #category : #private }
TokyoHashDatabase >> basicOpen: aString [
	^ self tchdbopen: aString mode: HDBOWRITER | HDBOCREAT
]

{ #category : #private }
TokyoHashDatabase >> basicOpenReadOnly: aString [
	^ self tchdbopen: aString mode: HDBOREADER
]

{ #category : #private }
TokyoHashDatabase >> basicRemoveKey: keyString [
	^ self tchdbout2: keyString
]

{ #category : #accessing }
TokyoHashDatabase >> size [ 
	^ self tchdbrnum
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbclose [
	^ self ffiCall: #(bool tchdbclose(self))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbecode [
	^ self ffiCall: #(int tchdbecode(self))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdberrmsg: ecode [
	^ self ffiCall: #(String tchdberrmsg(int ecode))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbget2: kstr [
	^ self ffiCall: #(void *tchdbget2(self, String kstr))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbget: kbuf size: ksiz resultSize: sp [
	^ self ffiCall: #(void *tchdbget(self, const void *kbuf, int ksiz, int *sp))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbiterinit [
	^ self ffiCall: #(bool tchdbiterinit( self ))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbiternext2 [
	^ self ffiCall: #(void *tchdbiternext2(self))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbopen: path mode: omode [
	^ self ffiCall: #(bool tchdbopen(self, String path, int omode))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbout2: kstr [
	^ self ffiCall: #(bool tchdbout2(self, String kstr))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbput2: kstr value: vstr [
	^ self ffiCall: #(bool tchdbput2(self, String kstr, String vstr))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbput: kbuf size: ksiz value: vbuf valueSize: vsiz [
	^ self ffiCall: #(bool tchdbput(self, const void *kbuf, int ksiz, const void *vbuf, int vsiz))
]

{ #category : #'private primitives' }
TokyoHashDatabase >> tchdbrnum [
	^ self ffiCall: #(uint64 tchdbrnum(self))
]
