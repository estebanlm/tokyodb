private
errorNoRec: keyString
	"If last error is ENOREC, then is not found. 
	 Otherwise is a general problem"
	self basicErrorCode = ENOREC
		ifTrue: [ NotFound signalFor: keyString ]
		ifFalse: [ self error: self lastError ] 