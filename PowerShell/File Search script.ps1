# Author: Joseph Sanchez
# Date: 9/26/2022
# Updated Date: 11/4/2022


# Purpose: Searches through every folder at the specified folder location.


#################################################

$Directory = "C:\users\SanchezJ\Downloads" # <--- Enter the path of where the desire folder resides.

cd $Directory #<-- moves to a folder path that is specified above.
$Folders = Get-ChildItem -File -Recurse | Format-Table # <--- This command will search for everything that it can find in a given folder location.

$Search = { 
Foreach ($file in $Directory) {

$Folders

}
}
& $Search

# Message prompt will display for 10 seconds and then will disappear automatically.
$Timer = {
$prompt = New-Object -ComObject wscript.shell
$message = $prompt.popup("Folder search complete", 10)
}
& $Timer
