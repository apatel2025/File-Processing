#----------------------------------------------------------------------------------------
# Description: This Python script uses the file newfile.txt and prints it's record such 
#              that the python interpretor counts "line two" but doesn't print it,
#              and it stops after printing "line four". 
#              
#
# Parameters: None
#
# History:
# Date              Author        Description
# 2018-02-24       A.Patel      Initial creation
#----------------------------------------------------------------------------------------

#assigning initial 0 value to the counter
count = 0

#open the file
Newfile = open('newfile.txt', 'r')

#print and count the specified lines in the file

for line in Newfile:

	#Incrementing the counter in the for loop
	count += 1
	
	#command which skips line two 
	if line == "Line two\n" : continue
	#command which stops after printing line four or breaks at line five
	if line == "Line five\n" : break
	#prints all the results which come true from the if statements
	print(line, end='')
	
	
	
#print the number of lines in the file
print("There are " + str(count) + " lines in the file")

	


#close the file
Newfile.close()







