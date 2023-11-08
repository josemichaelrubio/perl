use strict;
use warnings;
$|=1;

sub main {
    # * zero or more of the preceeding character, as many as possible
    # + one or more of the preceeding character, as many as possible
    # *? Zero or more of the preceding character, as few as possible
    # +? one or more of the preceeding, as few as possible
    # {5} five of the preceding 
    # {3,6} at lease 3 and at most 5


my $text = 'DE$12388';

    if($text=~ /(DE\$\d{3,})/){
        print("Matched: '$1'\n");
    }
}
main();