# Author: Joseph Sanchez
#Creation date: 7/7/2022

#Purpose:
 
#Copy all data and folders from directory to removable media, rename the folder. 
#The deletion process to the source directory of where the folder resides begins.

param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    Set-ExecutionPolicy -scope CurrentUser -ExecutionPolicy unrestricted -Force
}

cd 'C:\Users\Public\Documents'

For ('C:\Users\Public\Documents\StealthAudit') {
Get-ChildItem 'C:\Users\Public\Documents\StealthAudit'
if (".\StealthAudit") {
Copy-Item 'C:\Users\Public\Documents\StealthAudit' -Destination 'd:' -Recurse
For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Copying Files" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250 
}
break
}
}




cd 'D:'

For ("D:\StealthAudit") {
Get-ChildItem -Path "D:\StealthAudit" -Include *.* 
if ("D:\StealthAudit") {
Get-ChildItem *.csv | Rename-Item -NewName { $_.Name -replace "_", ""}
Get-ChildItem *.pdf | Rename-Item -NewName { $_.Name -replace " ", ""}

For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Renaming Files" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250 
} 
break
}
}

For ('D:\SteathAudit') {
Get-ChildItem 'D:\StealthAudit' -Recurse| Rename-Item -NewName {$_.name -replace "_", ""}
For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Renaming folders in progress" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250
}
break
}

cd 'C:\Users\Public\Documents'

Get-ChildItem -Path 'C:\Users\Public\Documents\StealthAudit' -Include *.*
if ('C:\Users\Public\Documents') {
Remove-Item 'C:\Users\Public\Documents\SteathAudit' -Recurse

For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Deleting folder in progress" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250
}
}

[system.Windows.MessageBox]::Show('Copy, rename, delete process complete')
