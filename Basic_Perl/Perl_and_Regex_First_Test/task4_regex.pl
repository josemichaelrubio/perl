=begin comment

=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {
    my $text = "The code for this device is GP8767.";

        if($text=~/(\b\w{2}\d{4}\b)/){
            print ("$1\n");
        }
        else {
            print ("Code not found\n");
        }
    }

main();