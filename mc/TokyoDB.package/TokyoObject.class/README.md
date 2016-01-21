I'm an external tokyo object, as retrived in raw from database. 
When retrieving objects (other than strings) we need not just the object, but also the amount of space it takes in memory (to be able to do a memcpy, for example). 

I make sure user has all the information he needs.

You do not need to free resources, they are managed automatically, so don't worry about dispose.