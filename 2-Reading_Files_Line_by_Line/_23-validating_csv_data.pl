=begin comment
Validating CSV Data

Often in CSV files, you get blank lines. It can cause errors when iterating over CVS files 
$line =~ /\S+/ or next; 
	• This would skip the line if it was blank  


Sometimes CVS files have the wrong number of values.
        my @values = split /\s*,\s*/, $line;
        if(scalar(@values) < 3){          # OR if(@values < 3){
            print "Invalid line: $line\n"; #embeed the line to know where the error is coming from
            next;
        }
        my ($name, $payment, $date) = @values;
	• This would check the number of values we got from the split. We disuse the intermediate array values to check the length
		○ the scalar() function when applying to an array will give us the number of elements 
			§ However, if you use an array in a scalar context like not using the scalar function, then it will still give us the numb


Apply some validation for empty values
        for my $value(@values){
            if($value eq '' ){
                print "Invalid line: $line\n";
                next LINE;
            }
        }
	• if you are comparing strings in Perl, you have use eq (equals) or ne (not equal).
	• Now we use LINE: to tell the program what next will restart(?) to. Since it will continue to process the invalid values
=end comment

=cut

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    my $input = 'test.csv';

    unless(open(INPUT, $input)){
        die "\nCannot open $input\n";
    };

    <INPUT>;

    my @data;

    LINE: while (my $line = <INPUT>){

        $line =~ /\S+/ or next; 

        chomp $line;

        my @values = split /\s*,\s*/, $line;

        if(scalar(@values) < 3){          # OR if(@values < 3){
            print "Invalid line: $line\n"; #embeed the line to know where the error is coming from
            next LINE;
        }

        for my $value(@values){
            if($value eq '' ){
                print "Invalid line: $line\n";
                next LINE;
            }
        }

        my ($name, $payment, $date) = @values;

        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );

        push @data, \%values;
     
    }

    close INPUT;

    # print all the values in column Payment:
   for my $data(@data){
        print $data -> {"Payment"} . "\n";
    };

    # refering to a particular value of an array
    # [index] gets the row
    # {key} gets the column
    print $data[3]{"Name"} . "\n";

}

main();