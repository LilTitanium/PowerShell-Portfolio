#Author: Joseph Sanchez
#Creation date: 7/6/2022
#Updated date: N/A

#Purpose: This script has been created to delete all files and folders within a single parent folder. 

#########################################################################################################

param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    Set-ExecutionPolicy  -scope CurrentUser -ExecutionPolicy unrestricted -Force
}

cd "C:\Users\Public\Documents" 
Get-ChildItem -Path "C:\Users\Public\Documents" -Include *.*
if ("C:\Users\Public\Documents\StealthAudit") {
Remove-Item 'C:\Users\Public\Documents\StealthAudit' -Recurse
For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Delete in progress" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250
}
}

[system.Windows.MessageBox]::Show('Files and folder deletion complete')
