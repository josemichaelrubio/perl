use warnings;
$|=1;

sub main {
    my $file = '/Users/josemichaelrubio/Programs/perl/projects/inferno.txt';

    open(INPUT, $file) or die("input file $file not found.\n");

    while(my $line = <INPUT>){
        if($line =~/(so*n)/){
            print "$1\n"
        }

    }

    close(INPUT); 
}
main();