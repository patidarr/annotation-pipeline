#!/bin/sh
#PBS -N anno-pipe
#CODE="/data/khanlab/apps/annovar/example"
#DIR="/data/khanlab/apps/annovar/example/test"
DATADIR="/data/Clinomics/Ref/annovar/"
TOOL="$CODE/addAnnotation.pl"
cd $DIR
$TOOL $FILE.anno.exac.3   $FILE.anno.gene >$FILE.anno.gene.exac
echo "1"
$TOOL $FILE.anno.clinseq  $FILE.anno.gene.exac >$FILE.anno.gene.exac.clinseq
echo "2"
$TOOL $FILE.anno.cadd     $FILE.anno.gene.exac.clinseq >$FILE.anno.gene.exac.clinseq.cadd
echo "3"
$TOOL $FILE.sift.out      $FILE.anno.gene.exac.clinseq.cadd >$FILE.anno.gene.exac.clinseq.cadd.sift
echo "4"
echo "5"
$TOOL $FILE.clinvar  $FILE.anno.gene.exac.clinseq.cadd.sift >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar
$TOOL $FILE.anno.cosmic  $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic
echo "6"
$TOOL $FILE.hgmd     $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd
echo "7"
$TOOL $FILE.match    $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match
echo "8"
$TOOL $FILE.docm     $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm 

echo "9"
$TOOL $FILE.candl    $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl

echo "10"
$TOOL $FILE.tcc      $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc

echo "11"
$TOOL $FILE.mcg      $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg
echo "12"
$TOOL $FILE.civic $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic
$TOOL $FILE.anno.pcg           $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic.pcg
echo "13"

$CODE/GeneAnnotation.pl $DATADIR/hg19_ACMG.txt $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic.pcg >$FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic.pcg.annotations.txt
echo "14"
$CODE/joinAllAnnotations.pl $FILE.anno.gene.exac.clinseq.cadd.sift.clinvar.cosmic.hgmd.match.docm.candl.tcc.mcg.civic.pcg.annotations.txt $FILE >$FILE.annotations.final.txt

rm -rf ${FILE}.anno ${FILE}.anno.* ${FILE}.candl ${FILE}.civic ${FILE}.docm ${FILE}.germline ${FILE}.hgmd ${FILE}.match ${FILE}.mcg ${FILE}.polyphen2.out ${FILE}.pph ${FILE}.pph2 ${FILE}.pph2.out ${FILE}.sift ${FILE}.sift.out ${FILE}.sift_predictions.tsv ${FILE}.tcc ${FILE}.uvm ${FILE}.clinvar

echo -e "Annotation Pipeline finished on File $FILE\n Please collect result from $DIR \n\nRegards, \nOncogenomics Section\nNCI" |mutt  -s "Annotation Pipeline Status"  `whoami`@mail.nih.gov -c patidarr@mail.nih.gov
