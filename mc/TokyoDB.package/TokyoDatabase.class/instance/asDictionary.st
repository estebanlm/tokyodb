converting
asDictionary 
	| dictionary |
	
	dictionary := Dictionary new: self size.
	self keysAndValuesDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary