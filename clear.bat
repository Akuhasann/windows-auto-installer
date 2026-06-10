@echo off
:: Judul Jendela Command Prompt
title Pembersih File Sampah Windows

:: -------------------------------------------------------------------------
:: OTOMATIS MEMINTA AKSES ADMINISTRATOR
:: -------------------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :MulaiPembersihan
) else (
    echo Meminta hak akses Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MulaiPembersihan
cls
echo ===================================================
echo     MEMULAI PEMBERSIHAN FILE SAMPAH WINDOWS
echo ===================================================
echo.

:: 1. Membersihkan Windows Temp
echo [+] Membersihkan Windows Temp (C:\Windows\Temp)...
del /f /s /q "C:\Windows\Temp\*" 2>nul
rmdir /s /q "C:\Windows\Temp" 2>nul
mkdir "C:\Windows\Temp" 2>nul
echo OK!
echo ---------------------------------------------------

:: 2. Membersihkan User Temp (%temp%)
echo [+] Membersihkan User Temp (%USERPROFILE%\AppData\Local\Temp)...
del /f /s /q "%temp%\*" 2>nul
rmdir /s /q "%temp%" 2>nul
mkdir "%temp%" 2>nul
echo OK!
echo ---------------------------------------------------

:: 3. Membersihkan Prefetch
echo [+] Membersihkan Prefetch (C:\Windows\Prefetch)...
del /f /s /q "C:\Windows\Prefetch\*" 2>nul
rmdir /s /q "C:\Windows\Prefetch" 2>nul
mkdir "C:\Windows\Prefetch" 2>nul
echo OK!
echo ---------------------------------------------------

echo.
echo ===================================================
echo             PEMBERSIHAN SELESAI!
echo ===================================================
echo.
echo Tekan tombol apa saja untuk menutup jendela ini...
pause >nul