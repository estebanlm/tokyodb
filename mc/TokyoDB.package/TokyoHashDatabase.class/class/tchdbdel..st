private primitives
tchdbdel: hdb
	^ self ffiCall: #( void tchdbdel ( void *hdb ) )