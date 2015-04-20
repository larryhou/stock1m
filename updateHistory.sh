#!/bin/bash

dir=history
if [ ! -d "${dir}" ]
then
	mkdir ${dir}
fi

cat HKG.t SHA.t SHE.t | while read ticker
do
	echo "fetch ${ticker} ..."
	output=${dir}/${ticker}
	touch ${output}
	yahooQuote -t ${ticker} > ${output}
done