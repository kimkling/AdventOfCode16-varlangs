#!/usr/bin/env perl
use warnings;
use strict;
use File::Slurp;
use Data::Dumper;

my $text = read_file('input.txt');
my @rows = split /\n/, $text;

my $idSum = 0;

foreach my $i (0 .. $#rows) { # (0 .. $#rows)
    my $row = $rows[$i];
    my @parts = split /\Q[/, $row;
    my %chars = ();
    foreach my $char (split //, $parts[0]){
        my @matches = $parts[0] =~ /\Q$char/g;
        if($char =~ /[a-zA-Z]/){
            $chars{$char} = @matches;
        }

    }

    my @list = sort { $chars{$b} <=> $chars{$a} or $a cmp $b } keys %chars;
    my $result = join("", @list[0..4]);
    my $checksum = $parts[1];
    $checksum =~ tr/]//d;

    if($checksum eq $result){
        my $id = substr($parts[0], -3) + 0;
        $idSum += $id;
    }
}
print $idSum . "\n";