#!/usr/bin/perl
use strict;
use warnings;
unless (open(ANN_FH, "$ARGV[0]")){
	print STDERR "Can not open file $ARGV[0]\n";
	die;
}
my %ANNOVAR;
while(<ANN_FH>){
	chomp;
	my @local = split ("\t", $_);
	my $key = join "\t", @local[0..4];
	my $end = @local - 1 ;
	my $value = join "\t", @local[5..$end];
	if(not exists $ANNOVAR{"$key"}){
		$ANNOVAR{"$key"} = $value;
	}
}
close ANN_FH;

unless (open (ORI,"$ARGV[1]")){
	print STDERR "Can not open file $ARGV[1]\n";
        die;
}

while (<ORI>){
	chomp;
	my @temp = split("\t", $_);
	my $val;
	my $vcf;	
	my $end = @temp - 1 ;
	$val = "$temp[0]\t$temp[1]\t$temp[2]\t$temp[3]\t$temp[4]";
	$vcf = join "\t", @temp[5..$end];
	print "$val\t$ANNOVAR{$val}\t$vcf\n";
}
