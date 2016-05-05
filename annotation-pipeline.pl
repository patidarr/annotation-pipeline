#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
###############
# Author:
#	 Rajesh Patidar rajbtpatidar@gmail.com
# Annotation pipeline v1
#
###############
my $partition="ccr";
my $host =`hostname`;
chomp $host;
if($host =~ /helix/){
	print STDERR "\n\n\n\tThis pipeline can only be ran on BIOWULF\n\n\n";
	exit;
}
my $file;
my $code_dir = "/data/Clinomics/Tools/annovar/";
my $data_dir = "/data/Clinomics/Ref/annovar";

GetOptions(
		'infile=s'	=>\$file,
		'q=s'		=>\$partition,
		help		=>sub {pod2usage(1);},
	  )or pod2usage(2);

=head1 SYNOPSIS

	annovar.pl[options]
	Usage:
	--infile	give the file containig output 
	-infile is a file in which the first 5 columns are following 
	Chr	Start	End	Ref	Alt # User commnets(other columns)
	The program will output header to the annovar result if the headings of the first columns are same as above.
	-q 		partition

	More detailed documentation can be found in README file in the /data/khanlab/apps/annovar/
=cut

my $DIR ='';
my $FILE='';
if (!$file){
	print STDERR "Give the file -infile <file containing snv list in residue or space based coordinate system>\n";
	die;	
}
my $dir = `pwd`;
chomp $dir;


if(-e "$dir/$file"){
#	print STDERR "\nYour input file is $dir/$file\n";
	$DIR = $dir;
	$FILE =$file;
}
elsif(-e $file){
#	print STDERR "\nYour input file is $file\n";
	if ($file =~ /(.*)\/(.*)/){
		$DIR = $1;
		$FILE =$2;
	}
}
else{
	print STDERR "File $file does not exists!!\n";
	print STDERR "Terminating...\n";
	die;
}
#########################
## Make Input Files    ##
#########################
`cd $DIR; $code_dir/MakeAnnotationInputs.pl $FILE `;

my $list = <<END;
$FILE
$FILE.anno.gene
$FILE.anno.exac.3
$FILE.anno.clinseq
$FILE.anno.cadd
$FILE.sift.out
$FILE.clinvar
$FILE.anno.cosmic
$FILE.hgmd
$FILE.match
$FILE.docm
$FILE.candl
$FILE.tcc
$FILE.mcg
$FILE.civic
$FILE.anno.pcg
END
open(OUT, ">$FILE.list");
print OUT "$list";
close OUT;
open(OUT, ">$FILE.final.sh");
print OUT "#!/bin/sh\n";
print OUT "#SBATCH --job-name=\"Annotation\"\n";
print OUT "cd $DIR\n";
print OUT "perl $code_dir/CombineAnnotations.pl $FILE.list >$FILE.tmp\n";
print OUT "perl $code_dir/GeneAnnotation.pl  $data_dir/hg19_ACMG.txt $FILE.tmp >$FILE.annotations.final.txt\n";
print OUT "rm -rf $FILE.tmp $FILE.anno.gene $FILE.anno.exac.3 $FILE.anno.clinseq $FILE.anno.cadd $FILE.sift.out $FILE.clinvar $FILE.anno.cosmic $FILE.hgmd $FILE.match $FILE.docm $FILE.candl $FILE.tcc $FILE.mcg $FILE.civic $FILE.anno.pcg $FILE.anno $FILE.pph $FILE.sift $FILE.sift_predictions.tsv $FILE.list $FILE.final.sh \n";
close OUT;

my $arg = "--export=CODE=$code_dir,DIR=$DIR,FILE=$FILE --partition=$partition --time=100:00:00";
my $annovar =`sbatch $arg --cpus-per-task=30 $code_dir/TableAnno.sh`;
my $SIFT    =`sbatch $arg --gres=lscratch:20 --mem=05g --cpus-per-task=2  $code_dir/SIFT.sh`;
chomp $annovar;
chomp $SIFT;
my $join    =`sbatch --export=CODE=$code_dir,DIR=$DIR,FILE=$FILE --partition=$partition --time=10:00:00 --mem=10g --dependency=afterany:$annovar:$SIFT $DIR/$FILE.final.sh`;
print "$join";
