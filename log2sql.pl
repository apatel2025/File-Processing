
#------------------------------------------------------------------------------
# Description:  This program opens a log file, reads through the log file one 
#               record at a time, and sends the source ip and port numbers to an
#				SQL database.				
#
# Parameters:  NONE
#
# History: 
# Date         Author         Description
# 2018-05-17  A. Patel     Initial creation
#------------------------------------------------------------------------------

#using warnings and DBI modules
use DBI;
use warnings;
use strict 'vars';
use strict 'refs';
use strict 'subs';

#opening the sample log file
my $lab_file = "C:\\Temp\\sample.log";
open SAMPLE_LOG, "< $lab_file" or die "Can't create file $lab_file because: $!";  

#assigning database name, user account, password and attributes
my $dbh = DBI->connect(          
    "DBI:SQLite:dbname=lab9.db", #giving the database a name
    "Administrator",             #specifying user account
    "tcpip",                     #and the password
    { RaiseError => 1,		     #an attrib statement
	  PrintError => 0}

) or die $DBI::errstr;

#hte provided SQL statement
$dbh->do("CREATE TABLE probes (
  source CHAR(15) NOT NULL,
  port CHAR(5) NOT NULL,
  PRIMARY KEY (source, port))");	

#preparing the statement handle
my $sth = $dbh->prepare("INSERT OR IGNORE INTO probes (source, port) VALUES (?,?)");  

while (my $record = <SAMPLE_LOG>) {
	if ($record=~ /INext-DROP-DEFLT/) {
		

# Check if there are records that matche the specified regex 
		my @relist=$record =~ /SRC=(.*?) .*DPT=(.*?) /;			
		
		#running the SQL statement
		$sth->execute($relist[0], $relist[1]);
}	
}	

#disconnecting, returns true or falses to avoid data loss
$dbh->disconnect();
