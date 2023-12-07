use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
  my $input = 'test.csv';
  
  unless(open(INPUT, $input)){
    die "\n Cannot open $input\n";
  }
  <INPUT>;

  my @lines;

  while(my $line = <INPUT>){
    chomp $line;
    #print "'$line'\n";
    my @values= split(/\s*,\s*/,$line);
    #print "$values[0]\n";
    #print Dumper(@values);

    

    push @lines, \@values;
  }

   close(INPUT);

   print $lines[0][0];

  foreach my $line(@lines){
    print Dumper($line); 
    print "Name " . $line->[0] . "\n";
  }
}

main();