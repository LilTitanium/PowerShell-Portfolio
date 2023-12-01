
$FileSearch = { 
$Directory = Read-Host -Prompt "Enter folder location where you want to search"
$Files = Get-ChildItem $Directory -Recurse

$Files
}
&$FileSearch

$Timer = {
Write-Host "Files search Complete."
$prompt = New-Object -ComObject wscript.shell
$message = $prompt.popup("File search complete", 10) #<-- The popup message box will automatically disappear after 10 seconds.
}
& $Timer