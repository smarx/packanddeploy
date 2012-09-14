@echo off
if "%ServiceHostingSDKInstallPath%" == "" (
    echo Can't see the ServiceHostingSDKInstallPath environment variable. Please run from a Windows Azure SDK command-line (run Program Files\Microsoft SDKs\Windows Azure\.NET SDK\^<version^>\bin\setenv.cmd^).
    GOTO :eof
)

cspack ServiceDefinition.csdef /out:PackAndDeploy.cspkg