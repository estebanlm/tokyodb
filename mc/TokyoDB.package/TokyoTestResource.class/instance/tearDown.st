running
tearDown
	database keysAndValuesDo: [ :aName :db | 
		db close.
		(self fileReferenceForName: aName) ensureDelete ].
	