@echo off
Setlocal enabledelayedexpansion

Set "Pattern= "
Set "Replace=."

For %%a in (*.*) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

echo Finished Removal of spaces

Pause&Exit