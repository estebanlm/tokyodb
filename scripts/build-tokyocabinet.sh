#! /bin/bash

default_tokyo_version="1.4.48"

if [ $1 == "" ]; then
	tokyo_version="$1"
else
	tokyo_version="$default_tokyo_version"
fi	

wget http://fallabs.com/tokyocabinet/tokyocabinet-$tokyo_version.tar.gz
tar xfz tokyocabinet-$tokyo_version.tar.gz
cd tokyocabinet-$tokyo_version
CFLAGS="-m32" LDFLAGS="-m32" ./configure
make
# put libraries in the root build 
echo -n "Copying library to root path"
cp -f lib* $ROOT
cd $ROOT