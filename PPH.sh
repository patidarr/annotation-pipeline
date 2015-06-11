#!/bin/sh
#
# This script will be submitted on cluster 
#
#PBS -N PPH2
#
cd $DIR
/usr/local/polyphen-2.2.2r405/bin/mapsnps.pl -g hg19 -U -y $FILE.pph2 $FILE.pph
/usr/local/polyphen-2.2.2r405/bin/pph_swarm.pl --block -o $FILE.pph2.out $FILE.pph2 --queue ccr
$CODE/ParsePPH2.pl $FILE.pph2.out >$FILE.polyphen2.out
