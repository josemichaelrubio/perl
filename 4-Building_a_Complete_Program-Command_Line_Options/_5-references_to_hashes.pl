=begin comment
We want to take that hash and turn it into a scalar value then pass it to the subroutine 
->
Same technique can be used with arrays
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

    # Arguement is a hash reference
    if(!checkusage(\%opts)){
        usage();
    }

=pod
    perl _5-references_to_hashes.pl -f test.xml -a -c
    Key value pairs:
        a = 1
        c = 1
        f = test.xml
=cut
    my $opts_ref = \%opts;

    # Use Hash directly
    print $opts{'f'} . "\n";

    # Use reference to hash
    # -> is used to dereference the hash reference. Only used for hash references like \%opts
    print $opts_ref->{'f'} . "\n";
}

sub checkusage{
    # $opts_ref variable is in a different scope than the one in main but 
    my $opts_ref = shift;

    print $opts_ref->{'f'} . "\n";

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