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
		help		=>sub {pod2usage(1);},
	  )or pod2usage(2);

=head1 SYNOPSIS

annovar.pl[options]
Usage:
	--infile	give the file containig output 
	-infile is a file in which the first 5 columns are following 
Chr	Start	End	Ref	Alt # User commnets(other columns)
The program will output header to the annovar result if the headings of the first columns are same as above.

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

my $annovar =`qsub -v CODE=$code_dir -v DIR=$DIR -v FILE=$FILE -q ccr -l nodes=1 $code_dir/TableAnno.sh`;
my $SIFT    =`qsub -v CODE=$code_dir -v DIR=$DIR -v FILE=$FILE -q ccr -l nodes=1 $code_dir/SIFT.sh`;
my $PPH     =`qsub -v CODE=$code_dir -v DIR=$DIR -v FILE=$FILE -q ccr -l nodes=1 $code_dir/PPH.sh`;
chomp $annovar;
chomp $SIFT;
chomp $PPH;
my $join    =`qsub -v CODE=$code_dir -v DIR=$DIR -v FILE=$FILE -q ccr -l nodes=1 -W depend=afterany:$annovar:$SIFT:$PPH $code_dir/combine.sh`;
print "$join";
