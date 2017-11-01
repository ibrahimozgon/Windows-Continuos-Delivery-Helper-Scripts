::We use this for building asset packages.
::1- Gulp command
::2- Asset folder path
::3- To Copy Build Path
cd %2 
CALL npm install 
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
CALL gulp %1 
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
CALL Robocopy %2 %3 /E /sl /XO /NFL /NDL /NJH /nc /ns /np /xf *.pdb *.orig
IF %ERRORLEVEL% LSS 8 exit /b 0