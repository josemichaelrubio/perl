=begin comment
Check how many values there are in the line 
    -   if there are less than three, skip that line
    -   If any of the values are blank, skip that line
=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {

    my $input = "test.csv" ;

    open INPUT, $input or die "\nCan't open $input\n";


    <INPUT>;

    # LINE indicates where the enclosed next statements iterate again
    LINE: while (my $line= <INPUT>){

        chomp $line;
        $line =~ /\S+/ or next;
        $line =~ s/^\s*|\s*$//g;

        # We split the lines and place them as seperate variables in an @values array
        my @values = split /\s*,\s*/, $line;

        # If a line contains less than 3 variables,-- 
        if(@values < 3){
            # --then `next LINE` will skip the current line-- 
            next LINE;
            # --and restart the iteration from `LINE:`
        }

        # Iterates over each line containing variables
        foreach my $value(@values){
            # If a line contains an empty string variable,--
            if($value eq ''){
                # --then `next LINE` will skip the current line-- 
                next LINE;
                # --and restart the iteration from `LINE:`
            }
            # ---Which is outside the Loop!
        }

        # Now we store the seperated, massaged, and valid values from @values array into scalar variables)
        my ($name, $payment, $date) = @values;

        print "$name: $payment, $date\n";

    }

    close INPUT;

}

main();