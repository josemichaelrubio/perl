=begin comment
Subroutines and Returning Values
--------------------------------
In Perl, you don't have to define the return type in a subroutine
there is no boolean in Perl
	• use 0 for false
use 1 for true
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub main {

    my %opts;

    getopts('af:c', \%opts);

    #checks if the user typed in the correct flags
    if(!checkusage()){
        # output a usage message that would tell the user how to use the program
        usage();
    }
}

sub checkusage{
    return 0;
}

sub usage{
    print "incorrect usage\n";
}

main();