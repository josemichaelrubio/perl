=begin comment
Figure how you can use the actual headings as the keys to the hash
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    my $input = "test.csv" ;

    open INPUT, $input or die "\nCan't open $input\n";\
    
    # We read the first line and store it in a variable
    my $headings = <INPUT>; # <INPUT> has the headers
    chomp $headings;
    # Now we split them up
    my @headings = split /\s*,\s*/, $headings;

    
    print Dumper(@headings);

    my @data;

    LINE: while (my $line= <INPUT>){

        chomp $line;
        $line =~ /\S+/ or next;
        $line =~ s/^\s*|\s*$//g;
        $line =~ s/\?|approx\.\s|\$//g;

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

        my %data = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date
        );

        push @data, \%data;

    }

    close INPUT;

    print Dumper(@data);    

    my $total = 0;
    foreach my $data(@data){
        $total += $data->{"Payment"};
    }
    print "Total payments: $total\n";

}

main();