::We use this for copying files.
::1- From Path
::2- To Path
Robocopy %1 %2 /E /sl /XO /NFL /NDL /NJH /nc /ns /xf *.pdb *.orig
IF %ERRORLEVEL% LSS 8 exit /b 0