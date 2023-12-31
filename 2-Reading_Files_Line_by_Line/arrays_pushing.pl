=begin comment

=end comment

=cut

use strict;
use warnings;

#use Data::Dumper;

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

    push @lines, $line;
  }

   close(INPUT);

  foreach my $line(@lines){
    print $line . "\n";
  }
}

main();