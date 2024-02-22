=begin comment
Write a single regular expression that will clean each line of data from any unwanted characters,--
--such as:
    ?
    approx.
    $
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my $input = "test.csv" ;

    open INPUT, $input or die "\nCan't open $input\n";


    <INPUT>;

    LINE: while (my $line= <INPUT>){

        chomp $line;
        $line =~ /\S+/ or next;
        $line =~ s/^\s*|\s*$//g;

        my @values = split /\s*,\s*/, $line;

        if(@values < 3){
            next LINE;
        }

        foreach my $value(@values){
            if($value eq ''){
                next LINE;
            }
        }

        my ($name, $payment, $date) = @values;

        print "$name: $payment, $date\n";

    }

    close INPUT;

}

main();