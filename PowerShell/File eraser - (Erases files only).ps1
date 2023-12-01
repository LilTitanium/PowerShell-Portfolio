#Author: Joseph Sanchez, IT Specialist (InfoSec)
#Creation date: 6/27/2022
#Updated Date: N/A

#Purpose: This script has been created to remove all files in each folder within a specified directory, but the folders and its structure will not be deleted. The reason why I crafted this script is when we need to delete data after when an audit project is over, instead of going through each folder and deleting them manually
#which would be time consuming, the script will go through each folder and delete those files for us. Folders and its structure will stay where they are.

######################################################################################################################################################################################################################################################################################################################################

param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    Set-ExecutionPolicy  -scope CurrentUser -ExecutionPolicy unrestricted -Force
}

cd C:\Users\Public\Documents\StealthAudit
Get-ChildItem -Path "C:\Users\Public\Documents" -Include *.* 
if ("C:\Users\Public\Documents\Audit") {
#Remove-Item "C:\Users\Public\Documents\SteathAudit" -Recurse | foreach { $_.Delete()}
Get-ChildItem -Recurse -File | Remove-Item
}
