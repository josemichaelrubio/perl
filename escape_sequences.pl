use strict;
use warnings;
$|=1;

sub main {
    # \d match any single digit
    # \s space
    # \S non-space
    # \w alphanumeric

    my $text = 'I am 30 years old';

    if($text=~ /(y\S*)/){
        print("Matched: '$1'\n");
    }
}
main();