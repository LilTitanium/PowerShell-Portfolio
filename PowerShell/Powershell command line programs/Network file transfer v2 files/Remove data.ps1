 $Remove = {
    
        $delete = Read-Host -Prompt "enter storage location for files you wanted deleted"
        $deleteFiles = get-location | Set-Location
        $PreviousDirectory = Read-Host -Prompt "enter any other folder besides the folder you want to delete."
        $deleteFiles
        cd $delete
        Get-ChildItem -Path $delete -Recurse 
        
        if ($delete) {
        Remove-Item $delete -Recurse
    $PreviousDirectory
    cd $PreviousDirectory
    Remove-Item $delete -Recurse -Force
    }
 }
 & $Remove
 

$Messages = {
$output = New-Object -ComObject wscript.shell
$result = $output.popup("Files deleted", 5)
}
& $Messages