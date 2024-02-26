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

    # Somethings the connent contains / thus we cannot use / to define the regular expression
    # m'' use m then single quotes to tell perl that we are using a regular expression
    # now within m'' we use () to define what we want to match
    if($content =~ m'<p class="site-description">(.+?)</p>'i) {
        # $1 is the first match
        print "The site description is: $1\n";
    } else {
        print "Site description not found\n";
    }
    # i is for case insensitive, so it doesn't matter if it is upper or lower case
    # note that if there is an href, that will also change, thus we need to use .+? too

    #print $content;

}

main();