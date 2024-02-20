=begin comment
Cleaning CSV Data

Specifying alternatives in regular expressions then use that to clean up CSV data

One common problem with CSV files is often we get space at the beginning or end of a line. Thus we have to clean the line BEFORE we process it.
        $line=~ s/<get rid>/<replace with>/;
	• We put stuff in here that we want to replace

Cleaning up the beginning of a line: 
To specify the beginning of a line in regular expression, we use ^
Thus:
        $line=~ s/^\s*//;
	• Here we gather all the spaces in the beginning of the line and replace it with nothing.

Cleaning up the end of a line:
To specify the end of a line in a regular expression, we use $
Thus: 
        $line =~ s/\s*$//;
	• Here we gather all the spaces at the end of the line and replace it within nothing

Cleaning up the beginning or the end of the line:
Here we use all that was mentioned above and specify one or the other alternatives by using the |
Thus:
        $line =~ s/^\s*|\s*$//;

Cleaning up both beginning and the end of the line:
We use the all that was mentioned above and the g (global replace, replace as mush as possible) at the end of the expression:
        $line =~ s/^\s*|\s*$//g;

Cleaning up random characters within the value:
Thus:
        $line =~ s/\?|approx\.|\$//g;
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    my $input = 'test.csv';

    unless(open(INPUT, $input)){
        die "\nCannot open $input\n";
    };

    # Gets rid the header line by reading it
    <INPUT>;

    my @data;

    LINE: while (my $line = <INPUT>){


        # Here we gather all the spaces in the beginning of the line and replace it with nothing.
#        $line =~ s/^\s*//; 
        # Cleaning up the empty spaces at teh end of a line
#        $line =~ s/\s*$//;
        # Here we are using the | is specify one or the other
#        $line =~ s/^\s*|\s*$//;
        # Here match using everything we did on top but as well as the other. By using g, meaning global.
        $line =~ s/^\s*|\s*$//g;
        # Here we are getting rid of unwanted characters within values
        $line =~ s/\?|approx\.|\$//g;
        # Gets rid of blank lines within the cvs
        $line =~ /\S+/ or next; 

        # Gets rid of a any new line
        chomp $line;

        #ANY space after the `split` and between / / changes everything
        #Gets rid of any spaces inside of the commas
        # splits the line
        my @values = split /\s*,\s*/, $line;

        if(scalar(@values) < 3){
            print "Invalid line: $line\n"; 
            next LINE;
        }

        for my $value(@values){
            if($value eq '' ){
                print "Invalid line: $line\n";
                next LINE;
            }
        }

        # Gets the line into variables
        my ($name, $payment, $date) = @values;

        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );

        push @data, \%values;
     
    }

    close INPUT;

   for my $data(@data){
        print $data -> {"Payment"} . "\n";
    };

    print "Descartes: " . $data[3]{"Name"} . "; Date: '" . $data[3]{"Date"} . "'\n";

}

main();