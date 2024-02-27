=begin comment
Character classes
Can be used in regular expressions, to match ranges of characters or alternative possibilities for different characters
Character classes allows to match a single character but that character is arbitrarily chosen
	[]

Character classes by default are going to boil down to one character

You can also specify characters that you don't want. Has to be the opening character
	[^]

Ranges
	• [0-9] any number
	• [A-Z] any uppercase character
	• C[A-Za-z_0-9]  -- specify alternatives
	• [\=\%] same as [=%] -- simply list alternatives
		○ Use \ liberally if you want. for any character that has special meaning in regex
	• [ABC] - list of alternates
	• [^0-9T\s] ^ Match anything except the specified character
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my $content = "The 39 Steps- a GREAT book! - Colours_15 ==%== AAAAABBBBABABABAACACCCC";

    # [] - character class
    # [0-9] - any digit
    if ($content =~ /([0-9])/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

    # [A-Z] - any uppercase letter
    # {2,} - at least 2
    if ($content =~ /([A-Z]{2,})/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

    # C[A-Za-z_0-9]{2,} - C followed by at least 2 letters, digits, or underscores
    if ($content =~ /(C[A-Za-z_0-9]{2,})/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

    # [\=\%]{2,} - either = or % that occurs at least 2 times
    if ($content =~ /([\=\%]{2,})/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

    # [ABC]{3,} - either A, B, or C that occurs at least 3 times
    if ($content =~ /([ABC]{3,})/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

    # Character classes can have exceptions using the ^ symbol
    # [^0-9T\s] - any character that is not a digit, T, or whitespace
    if ($content =~ /([^0-9T\s]{5,})/){
        print "Matched '$1'\n";
    }
    else{
        print "No match\n";
    }

}

main();