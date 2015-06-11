#!/usr/bin/perl
use strict;
use warnings;


open(FH, $ARGV[0]);
print "Chr\tStart\tEnd\tRef\tAlt\tPPH2 Prediction\tPPH2 Class\tPPH2 Probability\n";
while(<FH>){
	chomp;
	if($_ =~ /^#/){
	}
	elsif($_ !~ /unknown/ and $_ =~ /none/){
		my @data = split("\t", $_);
		$data[11] =~ s/\s+//;
		$data[14] =~ s/\s+//;
		$data[15] =~ s/\s+//;
		$data[55] =~ s/#//g;
#		$data[55] =~ s/\s+//g;
		$data[55] =~ s/\|/,/g;
		$data[55] =~ s/:/,/g;
		$data[55] =~ s/\s+//g;
		my @head = split(",", $data[55]);
		my $Start = substr($head[2], 0, 1);
		my $End = substr($head[2], 1, 1);
		print "$head[0]\t$head[1]\t$head[1]\t$Start\t$End\t$data[11]\t$data[14]\t$data[15]\n";
	}
}
close FH;
