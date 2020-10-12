#------------------------------------------------------------------------------
# Description: This program opens a log file, reads through the log file one 
#              record at a time, counts and optionally prints the source IP 
#              address, source port, and a specified number of characters for 
#              each record that matches a regex specified via a command line 
#              parameter, and prints the record count at the end.
#
# Parameters: $ARGV[0] = Regex to match in each record
#             $ARGV[1] = (Number of characters - 1) to print from each record that matches the regex
#                        If not defined, do not print any records
#
# History: 
# Date         Author         Description
# 2018-05-11  A. Patel     Initial creation
#------------------------------------------------------------------------------
use warnings;
use strict 'subs';

use Data::Dumper;

# Initialize the record count
my $count = 0;
my $count_ports_from =0;

# Open the file
my $file = "C:\\Temp\\sample.log";

my %hash_key; 
my %hash_table;


my @matches;



open SAMPLE_LOG, "< $file" or die "Can't create file $file: $!";


# Read through each record in the log file
while (my $record = <SAMPLE_LOG>) {

    # Check whether the record that matches the regex specified 
    if ($record =~ /INext-DROP-DEFLT/) {

        # Count how many records match the regex specified by $ARGV[0]
        $count++;
		
		
		(@matches) = $record =~ /(SRC=[0-9\.]* ).*(DPT=[0-9]*)/;
		
		
			
        
        # Extract the source IP address and port number from each record
        
		my $ip = $1;
		my $src_port = $2;
		
		$count_ports_from{$ip}{$src_port}++; 
		push @{$hash_key{$ip}}, $src_port; 
		push @{$hash_table{$src_port}}, $ip;
        
        # Print the source IP address, port number, and the first ($ARGV[1] + 1) characters of each record
		print $ip, "scanned ", $src_port ,%hash_table , "\n" if @matches;
		print Dumper \%hash_key;
		print Dumper \%hash_table; 

		foreach my $ip ( sort by_ip keys %count_ports_from ) {
	print "$ip: ";
	foreach my $port_num ( sort { $count_ports_from{$a} <=> $count_ports_from{$b} } 
       keys %{ $count_ports_from{$ip} } )
   {
      print "\t $port_num : $count_ports_from{$ip}{$port_num}\n";
   }


		
}
    }
}

print "\nThere are $count records that match the regex .\n";

# Close the file
close SAMPLE_LOG;
