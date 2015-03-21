#!/bin/bash
# Count strings in data files for fortune-zh
# Zhou Mo <cdluminate@gmail.com>

#set -e

DICT="tang300 song100 chinese"

for ITEM in ${DICT}; do
	printf "%2s${ITEM}:\t" 
	grep -c '^%' ${ITEM}
done
