use strict;
use warnings;
$|=1;

sub main {
    my $input = '/Users/josemichaelrubio/Programs/perl/projects/inferno.txt';

    open(INPUT, $input) or die("input file $input not found.\n");

    my $output = 'output.txt';

    open(OUTPUT, '>'.$output) or die "Can't create $output.\n";

    while(my $line = <INPUT>){

        

        if($line =~/\bfire\b/){
            $line =~ s/\byou\b/YOU/ig;
            print OUTPUT $line;

        }

    }
    close(INPUT);
    close(OUTPUT);

}
main();