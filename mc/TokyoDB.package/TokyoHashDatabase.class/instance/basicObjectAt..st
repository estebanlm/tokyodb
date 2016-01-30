private
basicObjectAt: keyString
	| result buffer |
	
	buffer := ByteArray new: (FFIExternalType sizeOf: #int).
	result := self tchdbget: keyString size: keyString size resultSize: buffer.
	result isNull ifTrue: [ ^ nil ].
	result autoRelease.
	^ TokyoObject object: result size: (buffer signedLongAt: 1)