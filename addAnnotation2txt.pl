#!/usr/bin/perl
use strict;
use warnings;

open(ANN_FH, "$ARGV[0]");
my %ANNOVAR;
my $cols=0;
while(<ANN_FH>){
        chomp;
        my @local = split ("\t", $_);
	my $key = join "\t", @local[0..4];
	my $end = @local - 1 ;
	$cols = $end - 5;
	my $value = join "\t", @local[5..$end];
	$ANNOVAR{"$key"} = $value;
}
close ANN_FH;

open (ORI,"$ARGV[1]");
while (<ORI>){
        chomp;
	my @temp = split("\t", $_);
	my $val =join "\t", @temp[0..4];
	my $end = @temp - 1 ;
	my $vcf =join "\t", @temp[5..$end];
	if(exists $ANNOVAR{$val}){
		print "$val\t$ANNOVAR{$val}\t$vcf\n";
	}
#	else{
#		print STDERR "$_\n";
#	}
}
close ORI;
