# Author: Joseph Sanchez, IT Specialist (InfoSec)
# Project: Network File Transfer 2.0

#Summary: Rebuilding the Network file transfer script, to have more effiencent file transfer.
#So as we create new folder project, the script can update the root folder within a storage path dynamically. So, we don't have update portion of the script anymore.

# I just need to reconfigure the folders so they can be created with the names the user inputs.

#NOTE: { If you want change the folder names; 
#you will need to go to "Create folder" script file and make name changes there; just after the command "mkdir"
# Then the main program will created the folders with a new names.
# When deleting files, the program may throw an error saying that it can't delete parent folder. Ignore the error, the parent folder gets deleted anyway. 
#}
######################################################################################

#Script locations. This location path of where these scripts reside and what makes the This main script function.
 #Based on what number the user presses, the program will call the assigned script and do the series of tasks it has been assigned.
 #NOTE: The beginning portion of the file path, just after the first double qoute, will change depending on where this parent folder is stored (Network file Transfer v2 files)
 $createFolders = "E:\Network file transfer v2 files\Create folders.ps1"
 $DataFiles = "E:\Network file transfer v2 files\Data transfer.ps1"
 $Remove = "E:\Network file transfer v2 files\Remove data.ps1"
 $FileSearch = "E:\Network file transfer v2 files\File search.ps1"
 #####################################################################################################

#### Below this line is the complete program in script form.

write-Host 'Welcome to Network File Transfer 2.0 '
 
Function Show-Menu {
param (
    [string] $Title = 'Welcome to Network File Transfer 2.0'
    )
    Clear-Host
    Write-Host "========$Title ========="

    Write-Host "1: Create folders"
    Write-Host "2: Transfer files"
    Write-Host "3: Delete files"
    Write-Host "4: Search for files"
    Write-Host "To exit program, hit the 'X' button on the top right corner."
 }                                                           
 Show-Menu


                                                         
$Selection = Read-Host "Please make a selection"
switch ($Selection)
{
    '1' { 
          & $CreateFolders
          
          break $CreateFolders
        }
        
         
    '2' { 
           & $DataFiles
            
            break $DataFiles
        }
            
    '3' {
           & $Remove
           

           break $Remove
        
        }
    '4' { 
            & $FileSearch

            break $FileSearch
        }
} 