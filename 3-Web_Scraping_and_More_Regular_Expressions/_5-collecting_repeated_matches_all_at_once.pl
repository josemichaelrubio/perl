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

    
    
}

main();