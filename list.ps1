#---------------------------------------------------------------------------------
# Description: This program prints a listing of the files in the current
#              directory, including each file's name, size, and creations date.
#              It also prints the path of the current directory and calculates
#              the total size of the files and prints it.
#				
# Parameters: None
#
# History:
# Date           Author          Description
# 2018-04-14  Aditya Patel    Initial creation
#---------------------------------------------------------------------------------

#Print headings for file info to be displayed
"{0,-20} {1,10} {2,14}" -f "File Name", "Size", "Creation Date"
"{0,-20} {1,10} {2,14}" -f ("=" * 20), ("=" * 10), ("=" * 14)

#Get a list of all items in the current directory
$dir = Get-ChildItem 


#block statement to display Size , file name and Creation Date
foreach ($item in $dir)
{
    #Filter out all sub-directories
    if ($item.Mode -notmatch "^d")
    {
        #Print the file name, size, and creation date
        "{0,-20} {1,10} {2,14:d}" -f ($item.Name + (" " * 20)).substring(0,20), $item.Length, $item.CreationTime
    }
}

#Print out the path of the current directory
$dir_path = Get-Location
"The current directory path is: $dir_path"

#To sum up and print the total size of the all the files in the directory
$item = Get-ChildItem -Recurse
$TotalSize = ($item | Measure-object -sum length).sum
echo "The total size of the file is $TotalSize"
