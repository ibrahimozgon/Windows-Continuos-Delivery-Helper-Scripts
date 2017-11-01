::::We use this for stopping iis application pool and web site
::%1 => IP Address
::%2 => site-name
set /a retryNumber=0
:RETRYSITE
set /a retryNumber=%retryNumber%+1
:: Stop IIS Site
CALL %%PsExecInstallationpath%%\PsExec.exe \\%1  -s -i C:\windows\system32\inetsrv\appcmd.exe stop site %2
IF %ERRORLEVEL% NEQ 0 (
    IF %reTryNumber% LSS 4 (
        echo There was an error '%ERRORLEVEL%' RETRYSITE again! %reTryNumber% 1>&2
        GOTO :RETRYSITE
    )
    IF %retryNumber% EQU 4 (
        GOTO :ERR
    )
)

set /a retryNumber=0

:RETRYAPPOOL
set /a retryNumber=%retryNumber%+1
:: Stop App Pool (removes lock on file system)
CALL %%PsExecInstallationpath%%\PsExec.exe \\%1  -s -i C:\windows\system32\inetsrv\appcmd.exe stop apppool %2
if %ERRORLEVEL% NEQ 1062 (
    IF %ERRORLEVEL% NEQ 0 (
        IF %reTryNumber% LSS 4 (
            echo There was an error '%ERRORLEVEL%' RETRYAPPOOL again! %reTryNumber% 1>&2
            GOTO :RETRYAPPOOL
        )
        IF %retryNumber% EQU 4 (
            GOTO :ERR
        )
    )
)

CALL ping 127.0.0.1 -n 2 > nul
exit /b 0

:ERR
echo sorry, this script stopped due to '%reTryNumber%' unsuccessful retries. 1>&2
EXIT /b %ERRORLEVEL%