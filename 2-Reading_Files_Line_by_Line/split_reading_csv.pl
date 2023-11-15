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

  while(<INPUT>){
    print $_
  }

  close(INPUT);
}

main();