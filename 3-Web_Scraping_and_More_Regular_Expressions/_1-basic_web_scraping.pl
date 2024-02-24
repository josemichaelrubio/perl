=begin comment

=end comment

=cut

# *NOTE: `cpan Mozilla::CA` must be installed first, via terminal. 
# It seems macOS requires `sudo` to install it.
# This module provides a copy of Mozilla's collection of trusted CA certificates. 
# It should be enough for most applications to validate the SSL connection.

## However, if you still encounter the issue or you can't install Mozilla::CA for some reason
## you can disable SSL verification as a last resort. 
## **NOTE: that this is not recommended for production code 
## as it makes your application vulnerable to man-in-the-middle attacks. 

use strict;
use warnings;

# This module provides a simple interface to the LWP library. It allows you to fetch web pages, post forms, etc.
use LWP::Simple;

$|=1;

sub main {

    # Creates a new user agent object
    # this object will be used to make the request to the web page
    my $ua = LWP::UserAgent->new;
    
    ##
    ## **NOTE: here is how you disable SSL verification as a last resort. 
##**     $ua->ssl_opts(verify_hostname => 0, SSL_verify_mode => 0x00);
    ## **NOTE: that this is not recommended for production code.
    ##
_
    my $response = $ua->get("https://josemichaelrubio.com/");

    # is_success method returns true if the request was successful
    unless($response->is_success) {
        # if the response is not successful, it will die and print the error message
        die "Can't get the content: ", $response->status_line;
    }

    my $content = $response->decoded_content;

}

main();