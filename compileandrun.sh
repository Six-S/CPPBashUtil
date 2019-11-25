#!/bin/bash
# Compile and run CPP in one foul swoop
# By: Brennan Link (Six-S)

#file should be the first cli argument
#argument should be the second cli argument 
FILE=$1
ARG1=$2

#split the file up so that we can make an output file of the same name
#we need to get rid of our ".cpp" to accomplish this.
readarray -d . -t strarr <<< "$FILE"

echo "Compiling..."

#compile the cpp, create output file of same name.
g++ $FILE -o ${strarr[0]}

echo "Created output file: ${strarr[0]}"

#run our file
#If any additional args were included run with those too
if [ ! -n "$ARG1" ]
then
	echo "Running ${strarr[0]}"
	./${strarr[0]}
else
	echo "Running ${strarr[0]} $ARG1"
	./${strarr[0]} "$ARG1"
fi
