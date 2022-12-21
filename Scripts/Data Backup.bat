@Echo off

Echo Backing up files...

robocopy "H:\Risk analysis Projects" "D:\Test" /e /z  

PAUSE

echo Backup complete!
