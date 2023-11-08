=begin comment
Task 2:
	• Create an array of made up email addresses
		○ Some should be valid and invalid based on this criteria: 
			§ At least one alphanumeric character
			§ followed by @
			§ Followed by at least one alpha numeric character
			§ followed by a dot
			§ followed by at least one alphanumeric character
	• Loop through the array and display the email address in turn
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {
    my @emails = (
        'blah@vcu.edu',
        'hhhhhhhhh',
        '.aaaaaaa',
        '2@email.com',
        'g@gmail.com',
        '...@...'
    );

    foreach my $email (@emails){
        if ($email=~/(\w+@\w+.\w+)/) {
            print "Valid email: '$1'\n";
        }
        else{
            print "INVALID EMAIL: '$email'\n";
        }
    }
}

main();