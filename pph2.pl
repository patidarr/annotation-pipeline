#!/usr/bin/perl
use strict;
use warnings;
my $CODE = $ARGV[0];
my $DIR = $ARGV[1];
my $FILE = $ARGV[2];

mkdir "$DIR/PPH.$FILE" or die "Can not create $DIR/PPH.$FILE\n";
chdir "$DIR/PPH.$FILE" or die "Can not go inside $DIR/PPH.$FILE\n";
`split -a 5  ../$FILE pph2`;

open(OUT, ">$DIR/pph.swarm");
open(OUT2, ">$DIR/pph.round");
for my $file (<*>){
	print OUT "mapsnps.pl -c -g hg19 -U -y $file.snps $file; pph -d ~/polyphen2/scratch/ $file.snps >$file.pph2; rm -rf $file $file.snps\n";
}

print OUT2 "#!/bin/sh\n";
print OUT2 "cat *.pph2 >../$FILE.pph2.out\n";
print OUT2 "rm -rf $DIR/PPH.$FILE $DIR/pph.swarm $DIR/pph.round\n";
print OUT2 "$CODE/ParsePPH2.pl $DIR/$FILE.pph2.out >$DIR/$FILE.polyphen2.out\n";
close OUT;
close OUT2;
