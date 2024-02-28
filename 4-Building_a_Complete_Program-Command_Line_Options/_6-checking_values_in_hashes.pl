=begin comment
Checking Values in Hashes
-------------------------
Use a built in subroutine in Perl called `exist` to see if values exist in a hash
=end comment
=cut

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub main {

    my %opts;

    getopts('af:r', \%opts);

    if(!checkusage(\%opts)){
        usage();
    }

=pod
    perl _5-references_to_hashes.pl -f test.xml -a -r
    Key value pairs:
        a = 1
        r = 1
        f = test.xml
=cut

}

sub checkusage{
 
    my $opts_ref = shift;

    my $a = $opts_ref->{"a"};
    my $f = $opts_ref->{"f"};
    my $r = $opts_ref->{"r"};

    # Imagine a is optional: if it is not there, it will be undef
    # r is mandatory: it means run the program
    # f is mandatory: it means file name

    unless(defined($r) and defined($f)){
        return 0;
    }

    unless($f=~/\.xml$/){
        print "File must have an .xml extension\n";
        return 0;
    }

    return 1;
}

sub usage{

    my $help = <<USAGE;

    usage: perl _3-multi_line_strings_and_comments.pl -f <file name> -a -c
        -f <file name>: specify xml file name to parse
        -a turn off error checking
        -r run the program
    example usage:
        perl _3-multi_line_strings_and_comments.pl -f test.xml -a -r

USAGE

    die $help;

}

main();