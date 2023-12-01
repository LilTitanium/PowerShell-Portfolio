$DataFiles = {
$Storage = Read-Host -Prompt "Enter source storage location"
$Storage
cd $Storage

$SupportingDocs = Get-ChildItem -Path $Storage # Note: it will pull all contents within folder location that user has specified.
$Move2NewStorage = Read-Host -Prompt "Enter destination storage location" # Note: Here is where you specify designation storage location.

Move-Item $SupportingDocs -Destination $Move2NewStorage # Note: Here is where the files will be move to new storage location that the user designated.
cd $Move2NewStorage

}
& $DataFiles


$Message = {
$output = New-Object -ComObject wscript.shell
$result = $output.popup("file transfer complete", 5)
}
& $Message