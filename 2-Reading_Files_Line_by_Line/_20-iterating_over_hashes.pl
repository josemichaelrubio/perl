=begin comment
Iterating over Hashes

Hashes are not ordered

each
	• a subroutine that returns an array per iteration. the arrays contain one key/value pair.
keys
	• a subroutine that collects all the keys at once. slow but helps sort a hash
	• sort
		○ a key word to sort the keys

You can declare an array in a subroutine in perl

In perl, for is short for foreach 
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {
    my %foods = (
        "mice" => "milk",
        "dogs" => "meat",
        "birds" => "seeds",
    );

    # We can define an array of variables like this:
    my ($one, $two, $three) = (19,72,113);

# Method 1: 
## gettings key then value as you need them
## Most efficent
    while( my ($key, $value)= each %foods){
        print "$key: $value\n";
    };

# Method 2:
## Getting all the keys at once
## It's slower, especially for big hashes, but it helps to sort the hash )
    
    my @animals = keys %foods;
    
    foreach my $key(@animals){
        my $value = $foods{$key};
        print "$key = $value\n";
    }

# Method 2.b:
## Same output but it's quicker.
## also includes the sort keyword, which can be use above as well

    foreach my $key(sort keys %foods){
        my $value = $foods{$key};
        print "$key = $value\n";
    }

}

main();