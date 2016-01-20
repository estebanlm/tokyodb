open/close
openReadOnly: aString 
	self withErrorControlDo: [ self basicOpenReadOnly: aString ]