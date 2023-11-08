use strict;
use warnings;
$|=1;

sub main {
    # \d match any single digit
    # \s space
    # \S non-space
    # \w alphanumeric

    my $text = 'I_am_30_years_old.......';

    if($text=~ /(\w*)/){
        print("Matched: '$1'\n");
    }
}
main();