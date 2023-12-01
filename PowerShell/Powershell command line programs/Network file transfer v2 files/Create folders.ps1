$CreateFolders= {
#$NetworkFolder = Get-Location | Set-Location
function storage {
 $read = Read-Host -Prompt "enter storage location"
 cd $read
 }

& storage

$createRootFolder = Read-Host -Prompt "Enter folder name"

$RootFolder = {
mkdir $createRootFolder
}
&$RootFolder


cd $createRootFolder

#create subfolders within Parent Folder.
 
#Note: [ In "()" just add names; that is what the folders will be called. Ex: "(Mikey, Mouse, Mini, etc)"
# Same goes for "". For example, at the "cd" command, the word deliverable that is in qoutes, can be changed another name.
# when its name is changed, the new name becomes that folder.]

$SubFolder = {@( mkdir "Plan", "Data Calls","Deliverable", "Design Matrix", "Entrance Conference Documents", "False Positive", "Fieldwork", "ROE", "System Assets") #<--- To create folders: Just add the name and have it in qoutes (eg. "DAS", "CRA", 'OIG', 'Feild work'). 
#If multiple folders make sure to add comma between each word that are in qoutes
}
& $SubFolder
cd "Deliverable" # <---- ** Note: At the beginning of this path, add the storage location before "$Folder" of where you want to folders to be stored (if storage location is different). Need to do this for every section of where it has "cd" command; starting from line 37 and forward.
$Subfolder = {@(mkdir "Audit Policies", "PSSC Completed - For Review", "PSSC Needed", "RAW Assessment Results")
}
& $Subfolder 
 cd "PSSC Needed" 
$Archive = {
@(mkdir "Archive")
}
& $Archive

$Subfolder1 = {@(mkdir "Export", "Exports", "Data")
}
& $Subfolder1
cd "file export"
$Archive = {
@(mkdir "Archive")
}
& $Archive
 } 
 & $CreateFolders

 $CreateFolderMessage = {
 $Shell = new-object -ComObject wscript.shell 
 $endresult = $Shell.popup("create folders complete", 5)
}
& $CreateFolderMessage
