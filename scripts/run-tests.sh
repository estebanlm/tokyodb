#!/bin/bash 

set -ex

baseline=TokyoDB
packages_dir=mc
test="$baseline.*"
pharo_version=50

# download pharo
wget --quiet -O - get.pharo.org/$pharo_version+vm | bash
# install project
./pharo Pharo.image eval --save "
Metacello new 
	baseline: '$baseline';
	repository: 'filetree://$packages_dir';
	load.
"
# execute tests
./pharo Pharo.image test --no-xterm --fail-on-failure "$test" 2>&1
