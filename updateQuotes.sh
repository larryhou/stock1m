#!/bin/bash

dir=quotes
if [ ! -d "${dir}" ]
then
	mkdir ${dir}
fi
cat HKG.t SHE.t SHA.t | while read ticket
do
	echo "fetch ${ticket} ..."
	output=${dir}/${ticket}
	touch ${output}
	googleQuote -t ${ticket} -d 100 > ${output}
	sort -k 1 -k 2 -r -o ${output} ${output}
done