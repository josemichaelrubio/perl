=begin comment
Finding all files in a Directory and filtering Arrays
----------------------------------------------------
Filter an array with built in subroutine: grep

Make main program light weight, only a few descriptive functions in main, then all then all the details in subroutines.
we can use

In Perl, there is no convention on naming. 

In Perl, if you don't have a return statement, it will return the last thing you typed in the subroutine

Many ways to get files in a directory
	• use a module
	• opendir…. readdir…closedir
etc
=end comment
=cut

use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$| = 1;

=pod

	This is ACME XML parser version 1.0
	Use with care.
	
=cut

sub main {
	my %opts;
	
	# Get command line options
	getopts('d:r', \%opts);
	
	if(!checkusage(\%opts)) {
		usage();
		exit();
	} 

	my $input_dir = $opts{"d"};

	my @files = get_files($input_dir);
	
    # In Dumper, getting a reference to the array is neater than getting the array itself.
	print Dumper(\@files);
}

sub get_files {
	my $input_dir = shift;
	
    # opendir opens a directory and returns a reference to a directory handle.
    # first argument is a reference to a directory handle
	unless(opendir(INPUTDIR, $input_dir)) {
		die "\nUnable to open directory '$input_dir'\n";
	}
	#readdir returns a list of all the files in the directory
	my @files = readdir(INPUTDIR);
    # close the directory handle
	closedir(INPUTDIR);
	
	# grep returns a list of all the elements in the array that match the condition
	@files = grep(/\.xml$/i, @files);
	
	return @files;
}

sub checkusage {
	my $opts = shift;
	
	my $r = $opts->{"r"};
	my $d = $opts->{"d"};
	
	# Image a is optional; don't really need to refer to it here at all.
	
	# r is optional
	# d is mandatory.
	
	unless(defined($d)) {
		return 0;
	}
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-d <directory>	specify directory in which to find XML files.
	-r run the program; process the files

example usage:
	# Process files in currect directory.
	perl main.pl -d . -r
	
USAGE
}

main();
