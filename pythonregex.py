#---------------------------------------------------------------------------------------------
# Description: This Python script is created to analyze the provided log file and to accept 
#              one parameter from the command line representing a string ("40686") to search 
#              for in the log records using a regex. This script also uses meaningful named 
#              subgroups to extract the source ip and port in the regular expressions  and 
#              The program should count the matching records and print the count at the end.
#
# Parameters: argv[1] (argv[1]="40686" for this given activity)
#
# History:
# Date              Author          Description
# 2018-03-03        A.Patel      Initial creation
#----------------------------------------------------------------------------------------------

#telling python interpretor to recognize regular expressions  
import re

#assigning a parameter
from sys import argv

#initialize the line counter
Count = 0

#open file
SampleLog = open("C:\\Users\\addyp\\Desktop\\sample.log",'r')

#setup regex with the parameter
Regex1 = re.compile(argv[1])

#using named subgroups to extract the source IP (source_ip) and port (source_port) from the log records
Regex2 = re.compile(r'(?P<source_ip>SRC=.*?0) .*(?P<source_port>SPT=.*?) ')

#---------------------------------------------------------------------------
#Other regular expressions that give the same result are as follows:
# Regex2 = re.compile(r'(SRC=[0-9.]*) .*(SPT=[0-9]*)')
# Regex2 = re.compile(r'(SRC=[\d.]*) .*(SPT=[\d*]) ')
#---------------------------------------------------------------------------


#process file
for Line in SampleLog:
	
	#search the current line for the regex match
	Match1 = Regex1.search(Line)
	
	if (Match1): 
		Count += 1
		
		#Extract & print source IP and port
		Match2 = Regex2.search(Line)
		if (Match2):
			print(Match2.group('source_ip'),Match2.group('source_port'), Line[0:45])
		
print("There are " + str(Count) + " lines in the file that contain " + argv[1] + ".")

#close file
SampleLog.close()
