#!/bin/bash

date=$(date "+%Y-%m-%d")
dir=history
if [ ! -d "${dir}" ]
then
	mkdir ${dir}
fi
cat tickets.HK | while read ticket
do
	echo "fetch ${ticket} ..."
	output=${dir}/${ticket}
	touch ${output}
	googleQuote -t ${ticket} -a  > ${output}
	sort -k 1 -k 2 -r -o ${output} ${output}
done