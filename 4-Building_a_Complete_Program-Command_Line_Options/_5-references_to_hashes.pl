use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub main {

    my %opts;

    getopts('af:c', \%opts);

    # Arguements are placed in the checkusage subroutine
    if(!checkusage("Hello", 7)){
        usage();
    }
}

sub checkusage{

    print Dumper(@_[0]);

    # Easier for single arguements
    #* my $greeting = shift @_;
    #* my $number = shift;

    # Place arguements in scalars to identify them
    # Greate for multiple arguements
    my ($greeting, $number) = @_;
    print "$greeting number $number\n";
    
    return 1;
}

sub usage{

    my $help = <<USAGE;

    usage: perl _3-multi_line_strings_and_comments.pl -f <file name> -a -c
        -f <file name>: specify xml file name to parse
        -a turn off error checking
        -c turn on feature c
    example usage:
        perl _3-multi_line_strings_and_comments.pl -f test.xml -a -c

USAGE

    die $help;

}

main();