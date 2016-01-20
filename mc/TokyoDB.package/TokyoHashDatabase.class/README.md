I'm a hash table database.

Hash database is a file containing a hash table and is handled with the hash database API. See `tchdb.h' for the entire specification.

Before operations to store or retrieve records, it is necessary to open a database file and connect the hash database object to it.  ==open:== used to open a database file and the ==close== is used to close the database file. 

To avoid data missing or corruption, it is important to close every database file when it is no longer in use. It is forbidden for multible database objects in a process to open the same database at the same time.