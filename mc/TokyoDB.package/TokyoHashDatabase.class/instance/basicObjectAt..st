private
basicObjectAt: keyString
	| result buffer |
	
	buffer := ByteArray new: (FFIExternalType sizeOf: #int).
	result := self tchdbget: keyString size: keyString size resultSize: buffer.
	result isNull ifFalse: [ result registerAsExternalResource ].
	
	^ TokyoObject object: result size: (buffer signedLongAt: 1)