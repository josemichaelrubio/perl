use strict;
use warnings;
$|=1;

sub main {

    my @files = (
        '/Users/josemichaelrubio/Programs/perl/projects/robot.png',
        '/Users/josemichaelrubio/Programs/perl/projects/helloworld.pl',
        '/Users/josemichaelrubio/Programs/perl/projects/missing.txt'
    );

    foreach my $file(@files){
        if(-f $file ){
        print "Found file: $file\n";
    }
    else{
        print "File not found: $file\n";
    }

    }


}

main();