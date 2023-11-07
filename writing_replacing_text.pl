use strict;
use warnings;
$|=1;

sub main {
    my $output = 'output.txt';

    open(OUTPUT, '>'.$output) or die "Can't create $output.\n";
    print OUTPUT "hello\n";
    close(OUTPUT);

}
main();