=begin comment
Store the line in an array of hashes
Then iterate through the array of hashes 
and add up the payments for each person and print the total.
=end comment

=cut

use strict;
use warnings;

# Data::Dumper is a module that helps us to print the data in a more readable format.
use Data::Dumper;
# It helps use check the data we are working with before doing arithmetics on it.

$|=1;

sub main {

    my $input = "test.csv" ;

    open INPUT, $input or die "\nCan't open $input\n";

    <INPUT>;

    # We initialize the array @data outside the loop
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

        # We create a hash to store the values
        my %data = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date
        );

        # Pushh the hash into the array
        push @data, \%data;
        # Remember to take the reference of the hash: `\%data`
        # Because when we say array of hashes in perl, we actually mean array of references to hashes
        # So when we say arrays to arrays, we mean array of references to arrays

    }

    close INPUT;
    # We place this print after closing since we are done with the file.

    print Dumper(@data);    

    #my $total = 0;
    #for my $data(@data){
    #    $total += $data{"Payment"};
    #};

}

main();