=begin comment
Sub usage print a nice message when check usage is false

multi-line string
	• << IDENTIFIER ;
IDENTIFIER
to end a multi-line string, end with the identifier with in no indent or ;
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

# Muli-line comment
=pod
Pod means "plain old documentation"
=cut

# single line comment

sub main {

    my %opts;

    getopts('af:c', \%opts);

    if(!checkusage()){
        usage();
    }
}

sub checkusage{
    return 0;
}

sub usage{

    # defining a multi-line string
    #print <<USAGE;
    # or
    my $help = <<USAGE;

    usage: perl _3-multi_line_strings_and_comments.pl -f <file name> -a -c
        -f <file name>: specify xml file name to parse
        -a turn off error checking
        -c turn on feature c
    example usage:
        perl _3-multi_line_strings_and_comments.pl -f test.xml -a -c

USAGE
# ends multi-line string
#* must be at the beginning of the line

    die $help;
    # or
    # exit();

}

main();