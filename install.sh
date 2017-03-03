#!/bin/bash

set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATA_DIR="${DIR}/data"

if [ -d ${DATA_DIR} ]
then
	rm -r ${DATA_DIR}
fi

python ${DIR}/constructer.py

for f in ${DATA_DIR}/*
do
	strfile ${f} ${f}.dat
done

sudo cp ${DATA_DIR}/* /usr/share/games/fortunes/
