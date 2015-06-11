#!/bin/sh
#
# This script will be submitted on cluster 
#
#PBS -N SIFT
#

cd $DIR
clearscratch
module load SIFT
SIFT_exome_nssnvs.pl -i $FILE.sift -d /fdb/sift/Human_db_37 -o $SIFT_SCRATCHDIR -z $DIR/$FILE.sift_predictions.tsv
$CODE/ParseSIFT.pl $DIR/$FILE.sift_predictions.tsv >$DIR/$FILE.sift.out
