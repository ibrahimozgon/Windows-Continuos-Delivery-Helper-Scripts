::We use this for copying files.
Robocopy %1 %2 /E /sl /XO /NFL /NDL /NJH /nc /ns /xf *.pdb *.orig
IF %ERRORLEVEL% LSS 8 exit /b 0