=begin comment
Write a perl program that reads a file line by line and prints the output of each line.
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my $input = "test.csv" ;

    open INPUT, $input or die "\nCan't open $input\n";

    while (my $line= <INPUT>){

        chomp $line;

        print "$line\n";
    }

    close INPUT;

}

main();