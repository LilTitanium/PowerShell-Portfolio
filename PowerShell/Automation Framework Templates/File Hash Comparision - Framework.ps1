#Project Title: File Hash Comparision script Framework
#Author: Joseph Sanchez (T), IT Cybersecurity Specialist

# This script below is the framework where the user can test the File Hash script functionality. All the enduser has to do is modify the sections where it has "< >", that is where the enduser adds their folder locations in those place holder areas.
# Once the enduser has added their folder locations, they can then run this File Hash script. The File Hash script will then do it magic sifting through the several folders and files and get their hash values and compare it.

$Directory = "<Original Storage Path>" #<-- Enter the source storage location here. e.g. c:\users\Mickey\Documents, would go in the "Original Storage Path" placeholder.

$DestinationDirectory = "<Destination Storage Path>" # <-- Enter Destination storage location here. The folder that is going to recieve the files going into the "Destination Storage Path" placeholder

$SourceStorageFiles = "Source storage files"
$DestinationStorageFiles = "Destination storage files"
$SourceStorageFolders = "Source Storage folders"
$DestinationStorageFolders = "Destination storage folders"

$Compare = {
 & $Compare | write-Output | Tee-Object -FilePath "<Location where you want result file to be written to and indicate what file type (e.g csv)>" -Verbose #<-- Enter storage location where you want csv file to be stored. Format: C:\users\Mickey\Documents 
Start-Transcript -OutputDirectory "<Location where you want the transcript file to be store>" -IncludeInvocationHeader -Verbose #<-- Enter location where you want transcript file to be stored. Same As previous line above.

Write-Host "=============File Hash Comparison========================"

Get-ChildItem -Recurse -Path $DestinationDirectory | foreach {Get-FileHash -Path $_.FullName} | Format-Table -Property hash, path

Get-ChildItem -recurse -Path $Directory | foreach {Get-FileHash -Path $_.FullName}| Format-Table -Property hash, path
(Compare-Object -ReferenceObject $Directory -DifferenceObject $DestinationDirectory -Property hash -PassThru).Path 

}



$Timer = {
Write-Host "File Hash Comparison Complete."
$prompt = New-Object -ComObject wscript.shell
$message = $prompt.popup("File Hash comparison complete", 10) #<-- The popup message box will automatically disappear after 10 seconds.
}
& $Timer

$count = {

Write-Host "=============Files & Folders Comparison========================"


Write-Host $SourceStorageFolders (dir $Directory -Directory -Recurse | measure).Count
Write-Host $DestinationStorageFolders (dir $DestinationDirectory -Directory -Recurse | measure).Count

Write-Host $SourceStorageFiles (dir $Directory -File -Recurse| measure).Count
Write-Host $DestinationStorageFiles (dir $DestinationDirectory -File -Recurse | measure).Count
}
& $count

$Timer = {
Write-Host "Files and folder Count Complete."
$prompt = New-Object -ComObject wscript.shell
$message = $prompt.popup("File and folder count complete", 10) #<-- The popup message box will automatically disappear after 10 seconds.
}
& $Timer

Stop-Transcript