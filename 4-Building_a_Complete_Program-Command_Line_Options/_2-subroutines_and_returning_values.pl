=begin comment

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
    return 1;
}

sub usage{
    print "incorrect usage\n";
}

main();