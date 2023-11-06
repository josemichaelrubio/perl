use strict;
use warnings;

sub main{



    my $file = '/Users/josemichaelrubio/Programs/perl/projects/robot.png';

    if(-f $file ){
        print "Found file: $file\n";
    }
    else{
        print "File not found: $file\n";
    }
}

main();