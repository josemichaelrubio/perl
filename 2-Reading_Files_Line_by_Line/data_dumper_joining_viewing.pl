=begin comment

=end comment

=cut

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

  while(my $line = <INPUT>){

    my @values= split ',', $line;

    # print join '|', @values;

    print Dumper(@values);
  }

  close(INPUT);
}

main();