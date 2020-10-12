#-------------------------------------------------------------------------------------------------------------------
# Description: This Python script scans through a directory that the user selects and inputs into the command line,
#              counting the number of files and the file size and printing the contents in a tree format including 
#              the sub-directories.
#
# Paramaters:	argv[1] = Directory path entered in the command line prompt
#
# History:
# Date			   Author				Description
# 2018-06-08	Aditya Patel	     Initial Creation
#-------------------------------------------------------------------------------------------------------------------

#importing required modules to run this program
import os 
import os.path
from sys import argv

#using def main so that thee source file executes all the code found in it.
def main():

#assigning a command line parameter to the directory path.
	Dirpath = argv[1]
	
	#code for verifying the file
	vf =os.path.isdir(Dirpath)
	print vf
	
	#initializing counters
	FileList=[]
	Size_count=0
	File_count=0
	
	#using the for loop and "os.walk() to create an iterable over the directory tree and keep doing it
	for root, dirs, files in os.walk(Dirpath):
	
	#prints the path entered in the command line and the directories which are being scanned through including the sub folders
		print root
		
		#general code block that indents the folders and subfolders using "count" and the code provided (os.sep) 
		indent = root.replace(Dirpath,'').count(os.sep)
		#assigning the amount of indent on different levels of directories
		tab = ' ' * 2 * (indent + 2)
		print('{}-{}-'.format(tab, os.path.basename(root)))
		subindent = ' ' * 2 * (indent + 2)
		
		#this for loop will assign the counters to the correct variables and displays their count.
		for file in files:
			FileList = os.path.join(root,file)
			Size_count += os.path.getsize(FileList)
			File_count += files.count(file)
			size = os.path.getsize(FileList)
			
			
		#printing the files and size inside the subfolders in the correct required format
			print ('{}-{}-'.format(subindent, file, size)),('{:,}'.format(size))
			
	#prints total size of the files in the directory selected
	print "Total sum of the file sizes in the selected directory is: " +('{:,}'.format(Size_count)) + " Bytes."
	#prints total number of files in the directory selected
	print "Total number of files in the selected directory is:", (File_count) 

	#using the if statement to check whether the global variable "__name__" is assigned to '__main__' or not, making the code importable by other modules.
if __name__ == '__main__':
	main()

    
    
