#!/bin/bash

#This script is capable of identifing whether a file follows the naming conventions established by Illumina.
set -x
FILES=$1

#for f in $FILES
#do
	#if [ -f == "?_S?_L00[1-8]_R[1-2]_001.{fastq.gz}"]
	#then
		#echo "True"
	#else
		#echo "False"
	#fi
#done
FILE_NAME_WITHOUT_PATH=$(basename -- "$FILES")
	echo $FILE_NAME_WITHOUT_PATH
NUMBER_OF_FIELDS_IN_NAME=`echo $FILE_NAME_WITHOUT_PATH | tr "_" "\n" | wc -l`
	echo "La variable numero de campos es $NUMBER_OF_FIELDS_IN_NAME"
SAMPLE_NAME=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f1` 
SAMPLE_NUMBER=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f2`
LANE=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f3`
READ=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f4`
LAST_SEGMENT=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f5`

#if [$SAMPLE_NUMBER == "S*" ] [ $READ == "R1" ] || [ $READ == "R2" ] | [ $LAST_SEGMENT == '001.fastq.gz']
	#then
		#echo "True"


