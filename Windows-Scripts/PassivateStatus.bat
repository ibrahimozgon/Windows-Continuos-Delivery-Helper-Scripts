::We use this for copying passive status files to production environment.
::%1 => Site Path

::Change Web Site Status
CALL Robocopy %%PassiveFilesPath%% %1 /NFL /NDL /NJH /nc /ns /np

IF %ERRORLEVEL% LSS 8 (
    :: Wait 60 Seconds
    :: This is useful if you have a command straight after that executes file operations on IIS App Directory
    CALL ping 127.0.0.1 -n 60 > nul
    exit /b 0
)
exit /b %ERRORLEVEL%
