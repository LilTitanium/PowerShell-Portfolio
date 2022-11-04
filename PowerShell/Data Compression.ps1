cd 'D:'
for ('D:\StealthAuditData(ICE)') {
Compress-Archive -Path 'D:\StealthAuditData(ICE)\*' -CompressionLevel Optimal -DestinationPath 'D:\StealthAuditData.zip'
For ($i = 1; $i -le 100; $i++) {
Write-Progress -Activity "Data compression in progress" -Status "$i% Complete" -PercentComplete $i
Start-Sleep -Milliseconds 250
}
break
}

[system.Windows.MessageBox]::Show('Data compression complete')
