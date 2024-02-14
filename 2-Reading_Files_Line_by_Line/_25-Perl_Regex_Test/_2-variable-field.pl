=begin comment
Get each line of the file and corrspond it to the appropiate field
Skip blank lines
Skip header lines
Skip spaces
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