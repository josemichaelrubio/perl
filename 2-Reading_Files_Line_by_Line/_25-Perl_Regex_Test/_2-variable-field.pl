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

    my @data;

    LINE: while (my $line= <INPUT>){

        $line =~ s/^\s*|\s*$//g;

        $line =~ s/\?|approx\.|\$//g;

        $line =~ /\S+/ or next;

        chomp $line;

        my @values = split /\s*,\s*/, $line;

        if(scalar(@values) < 3 ){
            print "Invalid line: $line\n";
            next LINE;
        }

        for my $value(@values){
            if($value eq ''){
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

}

main();