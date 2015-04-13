#!/bin/bash

date=$(date "+%Y-%m-%d")
dir=data
if [ ! -d "${dir}" ]
then
	mkdir ${dir}
fi
cat tickets.HK | while read ticket
do
	echo "fetch ${ticket} ..."
	output=${dir}/${ticket}
	touch ${output}
	googleQuote -t ${ticket} -d 100 >> ${output}
	cat ${output} | sort -k 1 -k 2 -r | uniq > ${output}.tmp
	mv -f ${output}.tmp ${output}
done