##############################
#Written by: Joseph Sanchez (Lil T)
#Date: 9/24/2021

###Summary###
# I have configured this script to install AutoCAD and Civil3D programs automatically.
# However, an install prompt window for each of AutoCAD programs (e.g. AutoCAD2017, AutoCAD2019, etc.), you click on "run" button once for each of them, the script will take care of rest.
# Make sure that you are logged in as the user before running the PowerShell script.

param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)



if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
}
# Set Execution Policy (if not already GPO'd)
Set-ExecutionPolicy  -scope CurrentUser -ExecutionPolicy unrestricted -Force

#Function Super_admin calls a Powershell file that houses the list of functions an then runs as command, to start installation process.

$Super_admin = {
cd d:

& '.\Dev PowerShell Scripts\KPFF scripts\civil_function.ps1'
}
& $Super_admin

& 'admin'
Function admin {
param([string[]]$parameterName
)
Add-Printer -ConnectionName \\sea28\HP8000
$ProgressPreference = 'silentlyContinue'
cd C:
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\MSI.Libraries\V.3\CAD\IDSP2016Basic\IDSP2016Basic.lnk
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\MSI.Libraries\V.3\CAD\IDSP2017Basic\IDSP2017Basic.lnk
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\MSI.Libraries\V.3\CAD\IDSP2018\IDSP2018BASIC.lnk
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\MSI.Libraries\V.3\CAD\IDSP2019Basic\IDSP2019Basic.lnk
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\MSI.Libraries\V.3\CAD\IDSP2020\IDSP2020Basic\IDSP2020Basic.lnk
Start-Process -Wait -ArgumentList "/silent" -FilePath \\kpff.com\dfs\software\Software\CAD\DesignReviewTrueview\1Design Review\Design Review 2020\Setup.ini

Remove-Item -Path "c:\CAD_Stds Civil14" -Recurse -Force
Remove-Item -Path "c:\CAD_Stds Civil16" -Recurse -Force
Remove-Item -Path "c:\CAD_Stds Civil17" -Recurse -Force
Remove-Item -Path "c:\CAD_Stds Civil18" -Recurse -Force
Remove-Item -Path "c:\CAD_Stds Civil19" -Recurse -Force
Remove-Item -Path 'c:\CAD_Stds Civil20' -Recurse -Force
Get-AppxPackage 'AutoCAD 2018.exe' | Remove-AppxPackage -Package 'AutoCAD 2018.exe'
Remove-Item -Path 'c:\Program Files\Autodesk\AutoCAD 2018' -Recurse -Force

Copy-Item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\Archive\CAD_Stds Civil14' -Destination 'c:\' -Recurse
copy-item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\Archive\CAD_Stds Civil16' -Destination 'c:\' -Recurse
Copy-Item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\CAD_Stds Civil17' -Destination 'c:\' -Recurse
Copy-Item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\CAD_Stds Civil18' -Destination 'c:\' -Recurse
Copy-Item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\CAD_Stds Civil19' -Destination 'c:\' -Recurse
Copy-Item -Path '\\kpff\dfs\Stdsdriv\CAD_Stds\Civil\CAD_Stds Civil20' -Destination 'c:\' -Recurse

if (( 'c:\Users\Public\Desktop\C3D 2017') -eq $true) {
Remove-Item -Path 'c:\Users\Public\Desktop\C3D 2017'
} else {
   Copy-Item -Path 'C:\CAD_Stds Civil17\Default Profiles\C3D 2017 KPFF.arg' -Destination 'C:\Users\Public\Public Desktop'
}
if (( 'c:\Users\Public\Desktop\C3D 2018') -eq $true) {
Remove-Item -Path 'c:\Users\Public\Desktop\C3D 2018'
} else {
   Copy-Item -Path 'C:\CAD_Stds Civil18\Default Profiles\C3D 2018 KPFF.arg' -Destination 'C:\Users\Public\Public Desktop'
}
if (( 'C:\ Users\Public \Desktop folder\C3D 2019') -eq $true) {
Remove-Item -Path 'C:\ Users\Public \Desktop folder\C3D 2019'
} else {
    Copy-item -Path 'C:\CAD_Stds Civil19\Default Profiles\C3D 2019 KPFF.arg' -Destination 'C:\Users\Public\Public Desktop'
}
if (('C:\ Users\Public \Desktop folder\C3D 2020') -eq $true) {
Remove-Item -Path 'C:\ Users\Public \Desktop folder\C3D 2020'
} else {
copy-item -Path 'C:\CAD_Stds Civil20\Default Profiles\C3D 2020 KPFF.arg' -Destination 'C:\Users\Public\Public Desktop'
}

mkdir 'C:\Temp'
mkdir 'C:\Temp\PDF'
mkdir 'C:\Temp\Plot'

Get-AppxPackage -Name 'Civil3D_2016_OE_64Bit.exe' |Remove-AppxPackage -Package "Civil3D_2016_OE_64Bit.exe"
Get-AppxPackage -Name 'C3D2016_x64_SP3.0.exe' | Remove-AppxPackage -Package 'C3D2016_x64_SP3.0.exe'
Get-AppxPackage -Name 'Civil3D_2016_SP3_OE_64Bit.exe' |install-Package '\\kpff.com\dfs\software\Software\CAD\AutoDesk 2016\AutoCAD 2016\Object Enablers\Civil3D_2016_SP3_OE_64Bit.exe' 
Get-AppxPackage -Name 'AutoCAD_2018.1.2_Update_64bit.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\Autodesk 2018\AutoCAD\Updates'
Get-AppxPackage -Name 'C3D_2018_3_Update.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\Autodesk 2018\Civil 3D\Updates\C3D_2018_3_Update.exe'
Get-AppxPackage -Name 'C3D_2018_3_2_Update.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\Autodesk 2018\Civil 3D\Updates\C3D_2018_3_2_Update.exe'
Get-AppxPackage -Name 'AutoCAD_2019.1.3_Update_64bit.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\AutoDesk 2019\AutoCAD\Updates\AutoCAD_2019.1.3_Update_64bit.exe'
Get-AppxPackage -Name 'C3D_2019_3_Update.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\AutoDesk 2019\Civil 3D\Updates\C3D_2019_3_Update.exe'
Get-AppxPackage -Name 'C3D_2019_3_2_Update.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\AutoDesk 2019\Civil 3D\Updates\C3D_2019_3_2_Update.exe'
Get-AppxPackage -Name 'AutoCAD_2020.1.4_Update_64bit.exe' | install-Package '\\kpff.com\dfs\software\Software\CAD\AutoDesk 2020\AutoCAD\Updates\AutoCAD_2020.1.4_Update_64bit.exe'
}

[System.Windows.MessageBox]::Show( 'Install complete.')
