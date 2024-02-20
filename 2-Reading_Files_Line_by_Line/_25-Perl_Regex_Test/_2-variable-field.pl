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

    # saves the csv file into a scalar called $input
    my $input = "test.csv" ;

    # opens $input and saves it to INPUT that can be Opened 
    open INPUT, $input or die "\nCan't open $input\n";

    # Reads the header and gets rid of it
    <INPUT>;

    while (my $line= <INPUT>){

        # Gets rid of a any new line
        chomp $line;
        # Gets rid of blank lines within the cvs
        $line =~ /\S+/ or next;
        # Gets rid of spaces upfront and at the end through the use of `| and `g`
        $line =~ s/^\s*|\s*$//g;
        
        # gets the line into variables by spliting the line on their commas , 
        my ($name, $payment, $date) = split /\s*,\s*/, $line;

        # Checking if we managed to split the into their variables
        print "$name: $payment, $date\n";
        # using the '' to see what the line consists of
        print "'$line'\n";
    }

    close INPUT;

}

main();