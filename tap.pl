#!/usr/bin/perl

#Andrew McLaughlin
#14Oct18
#Wiretap

use strict;
use warnings;

my $count = 0;
my $linenu = 1;
my @lines = ();

#test in regex, does not need \ \ brackets
print "Enter test:";
my $test = <STDIN>;
chomp($test);

open(FILE, "WireTap.txt") or die "Could not open WireTap.txt\n";

while(<FILE>)
{
	if ($_ =~ /$test/)
	{
		print "$linenu $_";
		push @lines, "$linenu $_";
		$count++;
	}

	$linenu++;
}
close(FILE);

print("Count = $count\n");

#If answer Y, starts script over, else writes output of test to file
print "Run Again? Y/N:";
my $try = <STDIN>;
chomp($try);

if($try eq "Y" or $try eq "y")
{
	do '/home/student/tap.pl';
}
else
{
	print ("Output written to file report.txt\n");

	open(STDOUT, '>', "report.txt") or die "Could not write report\n";

	foreach my $line (@lines)
	{
		print $line;
	}

	close(STDOUT);
}