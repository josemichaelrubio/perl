use strict;
use warnings;
$|=1;

sub main {
    # \d match any single digit
    # \s space
    # \S non-space
    # \w alphanumeric

    my $text = 'I_am 30_years_old.......';

    if($text=~ /(\w*\s\d+\S+)/){
        print("Matched: '$1'\n");
    }
}
main();