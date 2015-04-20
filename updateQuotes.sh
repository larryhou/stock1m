#!/bin/bash

dir=quotes
if [ ! -d "${dir}" ]
then
	mkdir ${dir}
fi

fetchQuotes()
{
	cat ${1}.t | while read ticket
	do
		echo "fetch ${ticket} ..."
		output=${dir}/${ticket}
		touch ${output}
		googleQuote -t ${ticket} -d 100 -x ${1}  > ${output}
		sort -k 1 -k 2 -r -o ${output} ${output}
	done
}

fetchQuotes SHE
fetchQuotes SHA
fetchQuotes HKG
