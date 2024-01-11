=begin comment
Storing CSV Data in a Data Structure
We use an array of hashes to store data from a csv file
It's storing references of hashes
Once completed, we can now refer to a value with the column name

keys will be the column
value will be the value of a particular line

elements of the array are references to hashes
->
	• to dereference
	• because when you have a reference to a hash, you must use -> to get the value of a hash

Perls converts a string hash value to a number automatically if it's only numbers
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

    while (my $line = <INPUT>){

        chomp $line;

        # How to refer to a key value using an index at any point of the program
        my ($name, $payment, $date) = split /\s*,\s*/, $line;

        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );

        push @data, \%values;
     
    }

    close INPUT;

    # print all the values in column Payment:
   for my $data(@data){
        print $data -> {"Payment"} . "\n";
    };

    # refering to a particular value of an array
    # [index] gets the row
    # {key} gets the column
    print $data[3]{"Name"} . "\n";

}

main();