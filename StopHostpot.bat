@echo off
echo Force stopping service...

sc stop icssvc

echo Setting to disabled...

sc config icssvc start= disabled

echo Killing related processes...

taskkill /f /im svchost.exe /fi "services eq icssvc"

echo Done.
pause