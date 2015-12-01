#!/bin/sh
#
# This script will be submitted on cluster 
#
#PBS -N PPH2
#
cd $DIR
module load polyphen2
mapsnps.pl -c -g hg19 -U -y ${FILE}.pph2 ${FILE}.pph
#pph -d /scratch/`whoami`/${RANDOM}${RANDOM}  ${FILE}.pph2 >${DIR}/${FILE}.pph2.out
pph_swarm.pl ${FILE}.pph2 -d /scratch/`whoami`/${RANDOM}${RANDOM} -o ${DIR}/${FILE}.pph2.out --partition $SLURM_JOB_PARTITION --block --bundle 100

$CODE/ParsePPH2.pl ${DIR}/${FILE}.pph2.out >$DIR/${FILE}.polyphen2.out
