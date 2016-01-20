finalization
finalizeResourceData: handle
	"I get sure DB is closed before freeing"
	self tchdbclose: handle.
	"Now we can free the resource"
	self tchdbdel: handle