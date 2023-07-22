#Project: Attribute Search Script
# Author: Joseph Sanchez, IT Cybersecurity Specialist

# Purpose: This script searches for the attribute of "msNPAllowDialin" within Active Directory.
# The reason why I have built this script is because there was a user that had PIV card issue when they tried to login into their computer.
# I have searched online,to develop a script that will search all user accounts that had attribute of "msNPAllowDialin" that were set to false.

#Note: You need to have Active Directory Powershell modules installed on your computer in order for the command "Get-ADUser" to work.
#You can get the Active Directory Powershell modules from RSAT (Remote Server Administration Tool) from Microsoft's website.

################################################################################


$users = Get-ADUser -filter {msNPAllowDialin -like "*"} -Properties msNPAllowDialin

if ($users.count -eq 0){
    Write-Host "No users found with the msNPAllowDialin attribute."
} else {
    Write-Host "Users found with the msNPAllowDialin attribute:"
    foreach ($user in $users){
        $userDialinStatus = if ($user.msNPAllowDialin) {"Allow"} else {"Not Allowed"}
        Write-Host "User: $($user.SamAccountName), Dial-in Status: $userDialinStatus"
    }
}