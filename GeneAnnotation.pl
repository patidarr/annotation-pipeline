#!/usr/bin/perl
use strict;
use warnings;
#Gene_refGene    ACMG_Disease    ACMG_Age-to-Report      ACMG_Gene-Reviews-PubMedID      ACMG_Inheritance        ACMG_Known-vs-Expected  ACMG_LSDB

unless (open(ANNOTATION, "$ARGV[0]")){
print STDERR "Can not open file $ARGV[0]\n";
        die;
}
my %HASH;
my $cols=0;
while(<ANNOTATION>){
        chomp;
	$_ =~ s/^#//g;
        my @local = split ("\t", $_);
	$cols = @local;
	if ($_ =~ /refGene/){
		$_ =~ s/Gene_refGene/ACMG_Gene/g;
		$_ =~ s/Gene.refGene/ACMG_Gene/g;
		$HASH{"Gene_refGene"} = "$_";
		$HASH{"Gene.refGene"} = "$_";
	}
	else{
		$HASH{"$local[0]"} = "$_";
	}
}
close ANNOTATION;

unless (open (FILE,"$ARGV[1]")){
	print STDERR "Can not open file $ARGV[1]\n";
        die;

}

my $string="\t-"x$cols;
while (<FILE>){
        chomp;
	my @temp = split("\t", $_);
	my $val =$temp[6];
	if (exists $HASH{$val}){
		print "$_\t$HASH{$val}\n";
	}
	else{
		print "$_"."$string\n";
	}
		
}
close FILE
