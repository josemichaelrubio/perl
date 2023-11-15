=begin comment
Task 3:
	• Declare string variable
	• Write a regular expression that can pick out machine code from text
		○ It has two alphanumeric characters
		○ Followed by 4 digits
	• Print machine code in the text or "not found" if there are no matches
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {
    my $text = "The code for this device is GP8767.";
        if($text=~/(\w{2}\d{4})/){
            print ("$1\n");
        }
        else {
            print ("Code not found\n");
        }
    }

main();