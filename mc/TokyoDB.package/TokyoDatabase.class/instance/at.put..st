accessing
at: keyString put: valueString 
	self withErrorControlDo: [ self basicAt: keyString put: valueString  ] 