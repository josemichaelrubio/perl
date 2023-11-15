=begin comment

=end comment

=cut

use strict;
use warnings;

$|=1;

sub main {
  my $input = 'test.csv';
  
  unless(open(INPUT, $input)){
    die "\n Cannot open $input\n";
  }
  <INPUT>;

  while(my $line = <INPUT>){
    my @values= split(',',$line);
    print "$values[0]\n";

    print join '|', @values;
  }

  close(INPUT);
}

main();