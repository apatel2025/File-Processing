#----------------------------------------------------------------------------------------
# Description:This program opens a log file, reads through the log file one 
#              record at a time, counts and optionally prints a specified 
#              information we need for each record that matches a regex 
#              with wildcards via a command line parameter, and prints the record 
#              count at the end.
#              
#
# Parameters: $ARGV[0] = Regex to match in each record.
#             $ARGV[1] = Number of characters to print from each record that matches the regex
#                        If not defined, do not print any records.
#
# History:
# Date               Author             Description
# 2018-02-05       Aditya Patel      Initial creation
#----------------------------------------------------------------------------------------

use warnings;
use strict 'subs';

# Initialize the record count
my $count = 0;

# Open the file
my $file = "C:\\Users\\addyp\\Desktop\\sample.log";
open SAMPLE_LOG, "< $file" or die "Can't create file $file: $!";

# Read through each record in the log file
while (my $record = <SAMPLE_LOG>) {
		
    # Count and print the records that match the first and second argument and 
		
	if ($record =~ /$ARGV[0]/) {
	
	# record that matches the regex with wildcards specified by SRC and SPT
		$record =~ /(SRC=[0-9\.]* ).*(SPT=[0-9]* )/;
		
		$count++;
		
		# Defining meaningful variables
		$src_ip = $1;
		$src_port = $2;
		
		#Adding the source port and source IP information to the print statement 
		
		print $src_ip, $src_port, substr($record, 0, $ARGV[1]), "\n" if $ARGV[1];
    }
	
}

print "\nThere are $count records that match the regex \"$ARGV[0]\" and \"$ARGV[1]\".\n";



# Close the file
close SAMPLE_LOG;
