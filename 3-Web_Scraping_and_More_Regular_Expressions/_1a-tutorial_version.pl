=begin comment
Make sure to install cpan Mozilla::CA first, via terminal.
It seems macOS requires sudo to install it.
=end comment

=cut

use strict;
use warnings;

# This module provides a simple interface to the LWP library. It allows you to fetch web pages, post forms, etc.
use LWP::Simple;

$|=1;

sub main {

    # Get the content of a web page
    my $content = get("http://www.josemichaelrubio.com");

    # Check if the content is defined
    # If it is not defined, it means that we couldn't get the content and it will run the block of code.
    unless(defined($content)) {
        die("Can't get the content");
    }

}

main();