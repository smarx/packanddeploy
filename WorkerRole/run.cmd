cd /d "%~dp0"
start /w mongoose-3.0.exe -r . -p %ADDRESS%:%PORT% -e error_log.txt