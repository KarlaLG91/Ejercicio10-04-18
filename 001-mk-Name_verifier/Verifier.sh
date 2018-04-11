#!/bin/bash

#This script is capable of identifing whether a file follows the naming conventions established by Illumina.
set -x
FILES=$1

FILE_NAME_WITHOUT_PATH=$(basename -- "$FILES")
        echo $FILE_NAME_WITHOUT_PATH
FASTQ_EXTENSION=`echo $FILE_NAME_WITHOUT_PATH | grep -c ".fastq.gz"`
NUMBER_OF_FIELDS_IN_NAME=`echo $FILE_NAME_WITHOUT_PATH | tr "_" "\n" | wc -l`
        echo "La variable numero de campos es $NUMBER_OF_FIELDS_IN_NAME"
SAMPLE_NAME=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f1` 
SAMPLE_NUMBER=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f2`
LANE=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f3`
READ=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f4`
LAST_SEGMENT=`echo $FILE_NAME_WITHOUT_PATH | cut -d"_" -f5 | cut -d "." -f1`

if [ $NUMBER_OF_FIELDS_IN_NAME != '5' ] 
        then
                echo "[ERROR] Tu archivo no tiene 5 campos en su nombre"
elif [ $READ != 'R1' ] && [ $READ != 'R2' ]
        then
                echo "[ERROR] Tu archivo no cumple con convencion R1 o R2"
elif [ $LANE != 'L001' ]
        then
                echo "[ERROR] Tu archivo no identifica los carriles"
elif [ $LAST_SEGMENT != '001' ]
        then
                echo "[ERROR] Tu archivo no incluye el ultimo segmento 001"
elif [ $FASTQ_EXTENSION != "1" ]
        then
                echo "[ERROR] LA extension del archivo no es la adecuada"
        else
                echo "Tu archivo cumple con las convenciones de Illumina"
fi

