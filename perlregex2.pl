#------------------------------------------------------------------------------
# Description: This program opens a log file, reads through the log file one 
#              record at a time, counts and optionally prints the source IP 
#              address, source port, and a specified number of characters for 
#              each record that matches a regex specified via a command line 
#              parameter, and prints the record count at the end.
#
# Parameters:  NONE
#
# History: 
# Date         Author         Description
# 2018-05-17  A. Patel     Initial creation
#------------------------------------------------------------------------------

use warnings;
use strict;

# Initialize the record count
my $src_ip = 0;
my $port_count=0;
my %hash;

# Open the file
my $lab_file = "C:\\Temp\\sample.log";
open SAMPLE_LOG, "< $lab_file" or die "Can't create file $lab_file because: $!";  

# Read through each record in the log file
while (my $record = <SAMPLE_LOG>) {

# Check if there are records that matche the specified regex 
	if ($record=~ /INext-DROP-DEFLT/) {
		$port_count++;
		my @relist=$record =~ /SRC=(.*?) .*DPT=(.*?) /;			
		$hash{$relist[0]}=[] unless exists $hash{$relist[0]};
		push @{$hash{$relist[0]}},$relist[1];
	}	
}
# Extract the source IP address and port number from each record
foreach my $SRC(keys(%hash)){
	$src_ip++;
	my @DPT = @{$hash{$SRC}};
	
	printf ("$SRC scanned @DPT\n",);
}
# Print the source IP address, port number, and the average of port numbers for each record
print "\n The number of source IP addresses that match are $src_ip.\n\n";
printf ("The average number of ports scanned for each address are %.2f.\n\n",$port_count/$src_ip);


# Close the file
close SAMPLE_LOG;








