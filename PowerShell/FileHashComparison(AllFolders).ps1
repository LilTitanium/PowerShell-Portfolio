 #Get-ChildItem $DestinationDirectory -Directory -Exclude 'usss_closed_special_cases', 'Usss_closed_fact_finder_cases'|Format-Table
$Directory = "E:"

$DestinationDirectory = "E:"

$SourceStorageFiles = "Source storage files"
$DestinationStorageFiles = "Destination storage files"
$SourceStorageFolders = "Source Storage folders"
$DestinationStorageFolders = "Destination storage folders"

$Compare = {
Start-Transcript -OutputDirectory "C:\users\jsanc\downloads" -IncludeInvocationHeader -Verbose #<-- where "C:\users\sanchezj\desktop\Everything" enter location where you want transcript file to be stored.

Write-Host "=============File Hash Comparison========================"

Get-ChildItem -Recurse -Path $DestinationDirectory | foreach {Get-FileHash -Path $_.FullName} | Format-Table -Property hash, path

Get-ChildItem -recurse -Path $Directory | foreach {Get-FileHash -Path $_.FullName}| Format-Table -Property hash, path
(Compare-Object -ReferenceObject $Directory -DifferenceObject $DestinationDirectory -Property hash -PassThru).Path 

}

 & $Compare | write-Output | Tee-Object -FilePath "C:\users\jsanc\downloads\Demo.csv" -Verbose #<-- where "C:\users\sanchezj\desktop\Everything" is enter storage location where you want csv file to be stored.


$Timer = {
Write-Host "File Hash Comparison Complete."
$prompt = New-Object -ComObject wscript.shell
$message = $prompt.popup("File Hash comparison complete", 10)
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
$message = $prompt.popup("File and folder count complete", 10)
}
& $Timer

Stop-Transcript