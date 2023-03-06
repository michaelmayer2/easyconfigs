#!/bin/bash

source global.sh

pushd singularity-builder 
for i in *.sdef
do
	newcontainer=$CONTAINER_PATH/${i/sdef/simg}
	if [ ! -f $newcontainer ]; then 
		singularity build $CONTAINER_PATH/${i/sdef/simg} $i
	fi
done
popd
