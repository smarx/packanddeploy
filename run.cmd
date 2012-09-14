@echo off
if "%ServiceHostingSDKInstallPath%" == "" (
    echo Can't see the ServiceHostingSDKInstallPath environment variable. Please run from a Windows Azure SDK command-line (run Program Files\Microsoft SDKs\Windows Azure\.NET SDK\^<version^>\bin\setenv.cmd^).
    GOTO :eof
)

cspack ServiceDefinition.csdef /copyOnly /out:PackAndDeploy.csx
csrun PackAndDeploy.csx ServiceConfiguration.Local.cscfg
if "%ERRORLEVEL%"=="0" ( echo Browse to the port you see above to view the app, e.g. http://127.0.0.1:81. To stop the compute emulator, use "csrun /devfabric:shutdown" )