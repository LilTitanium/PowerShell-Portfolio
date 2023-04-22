
$Directory = "E:" #<-- Enter the source storage location here.

$DestinationDirectory = "E:" # <-- Enter Destination storage location here.

$SourceStorageFiles = "Source storage files"
$DestinationStorageFiles = "Destination storage files"
$SourceStorageFolders = "Source Storage folders"
$DestinationStorageFolders = "Destination storage folders"

$Compare = {
Start-Transcript -OutputDirectory "C:\users\jsanc\downloads" -IncludeInvocationHeader -Verbose #<-- where "C:\users\jsanc\downloads" enter location where you want transcript file to be stored.

Write-Host "=============File Hash Comparison========================"

Get-ChildItem -Recurse -Path $DestinationDirectory | foreach {Get-FileHash -Path $_.FullName} | Format-Table -Property hash, path

Get-ChildItem -recurse -Path $Directory | foreach {Get-FileHash -Path $_.FullName}| Format-Table -Property hash, path
(Compare-Object -ReferenceObject $Directory -DifferenceObject $DestinationDirectory -Property hash -PassThru).Path 

}

 & $Compare | write-Output | Tee-Object -FilePath "C:\users\jsanc\downloads\Demo.csv" -Verbose #<-- where "C:\users\jsanc\downloads\Demo.csv" is enter storage location where you want csv file to be stored.


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
