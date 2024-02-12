=begin comment
Write a perl program that reads a file line by line and prints the output of each line.
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my $input = "test.csv" ;

    unless(open(INPUT, $input)){
        die "\ncannot open: $input\n"
    };

    <INPUT>;

    print INPUT;

    while (my $line= <INPUT>){
        print "$line\n";
    }

}

main();