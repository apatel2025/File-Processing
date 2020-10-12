#------------------------------------------------------------------------------
# Description: Quick and Dirty Perl 
#              This script scans through the DHCP lease file and extracts a few 
#              interesting lines from it.
#
# Parameters: none
#
#
# History: 
# Date               Author          Description
# 2018-06-12      Aditya Patel     Initial creation
#------------------------------------------------------------------------------

#this command is used to skip the lines starting with a pound symbol "#"
next if /^#/;

#prints the IP address and the start time and the client- hostnames
print "\n$1" if /lease (.*) /;

print "$1" if /starts . (.*);/;

print "$1" if /client.* (.*);/;

#the end code block which prints the final 
END { print "\n"; }
