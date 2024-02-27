=begin comment

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

    while($content=~ //g){
        # trawls through your data and find one match after another
        # memory efficent
        # however, you must write one while loop after another to gather the things you need
    }

        # use a regular expression in an array context, it returns all the things that it matched
    my @classes = $content =~ m|class="([^"']*?)"|ig;
        # Note: using a regualr expression in a if or while loop context, it is treated as a true or false
        # Using an array in a scalar context
    if(@classes == 0){
        print "No matches found\n";
    } else {
        foreach my $class(@classes){
            print $class . "\n";
        }
    }
    
}

main();