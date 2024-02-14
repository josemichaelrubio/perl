=begin comment
Get each line of the file and corrspond it to the appropiate field
    So I need a hash
Skip blank lines
Skip header lines
Skip spaces
    So I need replace with s///
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

        my ($name, $payment, $date) = split /\s*,\s*/, $line;

        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );

        push @data, \%values;
    }

    close INPUT;

}

main();