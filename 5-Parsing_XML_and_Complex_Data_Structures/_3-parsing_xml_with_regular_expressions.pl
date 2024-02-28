=begin comment
Parsing XML with Regular Expressions
-------------------------------------
Set a record separator in order to read a file chuck by chunk
	• Since we are dealing with XML, want to use read from open tag to close tag, one entry at a time
Record separator: `$/`
	• by default it is a new line
	• It is global, thus, if try to use it again, it will use the default or its latest value

Two ways of dealing with xml: 
	• Manual 
	• Modules

This portion is manual because it is more flexible and applied to any kind of file
This is great for massive xml files, using modules is slower.
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

    process_files(\@files, $input_dir);
	
}

sub process_files {
    my ($files, $input_dir) = @_;
    
    foreach my $file(@$files) {
        process_single_file($file, $input_dir);
    }
}

sub process_single_file {
    my ($file, $input_dir) = @_;

    print "Processing $file in $input_dir...\n";

    # get the full path to the file
    my $filepath = "$input_dir/$file";
    # read this file chuck by chunk
    open(INPUTFILE, $filepath) or die "\nUnable to open $filepath\n";

    #* Record separator
    $/ = "</band>";

    # process the file
    while(my $chunk = <INPUTFILE>) {

        # to get result, use array context
        # ($band) is an array
        my ($name) = $chunk =~ m'<name>(.*?)</name>';

        unless (defined($name)) {
            next;
        }

        print "BAND: $name\n";

        my @members = $chunk =~ m'<member>(.*?)</member>'sg;

        print "MEMBERS:  ". scalar(@members) . "\n";

        print Dumper(@members);

    }

    close(INPUTFILE);
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