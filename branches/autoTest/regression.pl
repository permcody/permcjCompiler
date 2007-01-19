#!/usr/bin/perl

use strict;
use warnings;

my $compiler_bin = "/home/permcj/c-/compiler/c-";
my $verbose = "> /dev/null 2>&1";

#if ($#ARGV == 2 && $ARGV[1] eq "-v") {
#	$verbose = "";
#}

my $counter = 0;
foreach my $sourceFile (<*.c->) {
	#if ($counter++ >= 10) { last; }

	chomp $sourceFile;
	my ($baseName) = $sourceFile =~ /^(.*)\.c-$/;

	print "\n\nTesting $baseName ...";

	################## Run the compiler
	print "\nCompiling...", " "x30;
	if (system ("$compiler_bin -o $baseName.s $sourceFile > $baseName.testout 2>&1")) {
		print "Differences Found";

		# If the compiler gets warnings - do a difference with the output file to see if these errors are expected
		print "\nCompilation Correctness...", " "x16;		
		my $output = `diff $baseName.out $baseName.testout > $baseName.diff`;	
		if ($output) {
			print "Failed";
		}
		else {
			print "Success";
		}

		next;
	}
	print "Success";

	################## Run the assembler/linker
	print "\nAssembling/Linking...", " "x21;
	if (system ("gcc -m32 -o $baseName $baseName.s $verbose > $baseName.testout 2>&1")) {
		print "Differences Found";

		# If the assembler or linker gets warnings - do a difference with the output file to see fi these errors are expected
		print "\nAssembling/Linking Correctness...", " "x9;
		my $output = `diff $baseName.out $baseName.testout > $baseName.diff`;
		if ($output) {
			print "Failed";
		}
		else {
			print "Success";
		}

		next;
	}
	print "Success";

	################## Run the program
	print "\nRunning...", " "x32;
	my $execString = "./$baseName";
	if (-e "$baseName.in") {
		$execString .= " < $baseName.in";
	}
	$execString .= " > $baseName.testout";
	if (system $execString) {
#		print "Failed";
#		next;
	}
	print "Success";

	################## Check for correctness
	print "\nRuntime Correctness...", " "x20;
	my $output = `diff $baseName.test $baseName.testout`;
	if ($output) {
		print "Failed";
		next;
	}
	print "Success";

}

print "\n";
