=begin comment
Getting Command Line Options
----------------------------
A Program to Parse XML code

In Perl, All the command line arguments come through in an array called ARGV

Perl Command-Line Options

use Getopt:: std;
	• enables flexible argument retrieval
	• You need a hash with your arguments that will be filled with key value pairs
		○ keys are flags
values are optional arguments to those flags
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub main {

    print Dumper(@ARGV);
    print $ARGV[0] . "\n";

    my %opts;

    # a,f, and c are arbitrary flags
    # : indicates that f takes in an arguement
    getopts('af:c', \%opts);
    print Dumper(%opts);
    my $file = $opts{'f'};
    print "File: $file\n";
}

main();