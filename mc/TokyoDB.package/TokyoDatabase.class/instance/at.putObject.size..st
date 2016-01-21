accessing
at: keyString putObject: aByteArrayOrExternalAddress size: size 
	"Takes a ByteArray or ExternalAddress as an object representation"
	self withErrorControlDo: [ 
		self 
			basicAt: keyString 
			putObject: aByteArrayOrExternalAddress 
			size: size  ] 