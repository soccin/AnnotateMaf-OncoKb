#!/bin/bash

SDIR="$( cd "$( dirname "$0" )" && pwd )"

if [ $# != "2" ]; then
    echo
    echo "   usage: annotateMaf_OncoKb.sh INPUT_MAF DATA_CLINCAL_FILE"
    echo
    exit
fi

ONCOKB_TOKEN=$(cat $SDIR/oncokb*token)

MAF=$1
BASE=$(basename $MAF | perl -pe 's/\.[^.]*$//')
EXT=$(basename $MAF | perl -pe 's/.*\.//')

CLINICAL=$2

. $SDIR/venv.oncokb/bin/activate

python3 $SDIR/oncokb-annotator/MafAnnotator.py \
    -i $MAF \
    -o ${BASE}.oncokb.$EXT \
    -c $CLINICAL \
    -b $ONCOKB_TOKEN

deactivate

echo OUTMAF=${BASE}.oncokb.$EXT

