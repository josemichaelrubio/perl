=begin comment
Matching Repeatedly
-------------------
How to do multiple matches in one string

A memory efficient way to do it

make use of character classes

If you want to do some serious web scraping, use a module

m||sig
	• sig is useful for long documents
		○ Treat the whole thing as a single line and allow things to be matched to multiple lines, uppercase or lower case, and do the matches repeatedly

Build regular expressions bit by bit, build it up bit by bit
=end comment

=cut

use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {

    my $ua = LWP::UserAgent->new;

    my $response = $ua->get("https://josemichaelrubio.com/");

    unless($response->is_success) {
        die "Can't get the content: ", $response->status_line;
    }
    my $content = $response->decoded_content;
    
    # Creating a regular expression that can match something repeatedly
    # m is for match, s is for treat new lines as a regualt character, i is for case insensitive, x for allowing spaces and new lines
    # sigx is useful for large documents
    while($content =~ m|<\s*a\s+[^>]*href\s*=\s*['"]
    ([^>"']+)['"][^>]*>\s*
    ([^<>]*)\s*</|sig){
        print "$2: $1\n"
    }
    
}

main();