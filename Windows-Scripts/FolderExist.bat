:: We use this in Green pipeline. If checks packacge path is true!
::%1 => Folder Path
IF EXIST %1 GOTO FOUND
echo "!%1 NOT FOUND!"
exit /b 1000
:FOUND
echo "%1 FOUND"