@echo off
echo ===============================
echo DISABLING WINDOWS UPDATE TOTAL
echo ===============================

echo.
echo Creating Registry Policy...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f

echo.
echo Stopping Services...
net stop wuauserv
net stop WaaSMedicSvc
net stop UsoSvc

echo.
echo Disabling Services...
sc config wuauserv start= disabled
sc config UsoSvc start= disabled

echo.
echo DONE.
pause