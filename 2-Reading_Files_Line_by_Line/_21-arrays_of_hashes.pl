=begin comment
Arrays of Hashes

How to store hashes in array. Useful for csv.

Push
    push @test, %hash1;
	• This will put all the keys and values as septate elements of an array 
	• Thus, we have to reference to the hash
    push @test, \%hash1;
	• This will place the entire hash as one element  in the array
  
  print $test[0]{"birds"} . "\n";
how to get the value of a hash using its key in an array.
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my %hash1 = (
        "cat" => "meats",
        "birds" => "seeds",
        "fish" => "worms",
    );

    my @test;

# push
    push @test, \%hash1;
# How to get the values from an array with hashes
    print $test[0]{"birds"} . "\n";

}

main();