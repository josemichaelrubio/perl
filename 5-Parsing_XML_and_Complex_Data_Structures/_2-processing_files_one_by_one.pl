=begin comment
Processing Files One by One
---------------------------
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

    # reference to an array is easier to handle
    # #input_dir can be used if there is an error
    process_files(\@files, $input_dir);
	
}

sub process_files {
    my ($files, $input_dir) = @_;

    print "input_dir: $input_dir\n";
    print Dumper($files);
    
    # @$ casts the reference to an array, here to it's orginial type
    foreach my $file(@$files) {
        #a sub routine to process a single file
        process_single_file($file, $input_dir);
    }
}

sub process_single_file {
    my ($file, $input_dir) = @_;

    print "Processing $file in $input_dir...\n";
}

sub get_files {
	my $input_dir = shift;
	
	unless(opendir(INPUTDIR, $input_dir)) {
		die "\nUnable to open directory '$input_dir'\n";
	}
	my @files = readdir(INPUTDIR);
	closedir(INPUTDIR);
	
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