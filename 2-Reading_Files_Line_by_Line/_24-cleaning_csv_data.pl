=begin comment

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

        $line =~ /\S+/ or next; 

        chomp $line;

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