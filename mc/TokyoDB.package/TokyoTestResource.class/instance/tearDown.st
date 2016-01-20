running
tearDown
	database keysAndValuesDo: [ :class :db | 
		db close.
		(self fileReferenceFor: class) ensureDelete ].
	