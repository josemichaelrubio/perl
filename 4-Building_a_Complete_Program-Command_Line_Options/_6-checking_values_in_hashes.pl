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

    if(!checkusage(\%opts)){
        usage();
    }

=pod

=cut

    my $opts_ref = \%opts;

    print $opts{'f'} . "\n";

    print $opts_ref->{'f'} . "\n";
}

sub checkusage{
 
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