@echo off
:: Judul Jendela Command Prompt
title Windows Services Optimizer

:: -------------------------------------------------------------------------
:: OTOMATIS MEMINTA AKSES ADMINISTRATOR
:: -------------------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :MulaiOptimasi
) else (
    echo Meminta hak akses Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MulaiOptimasi
cls
echo ===================================================
echo     MEMULAI OPTIMASI SERVIS BACKGROUND WINDOWS
echo ===================================================
echo.

:: 1. Mematikan SysMain (Superfetch) - Mengatasi Disk 100%
echo [+] Menghentikan SysMain (Superfetch)...
sc stop SysMain >nul 2>&1
sc config SysMain start= disabled >nul 2>&1

:: 2. Mematikan Windows Search - Mengurangi beban index file
echo [+] Menghentikan Windows Search...
sc stop WSearch >nul 2>&1
sc config WSearch start= disabled >nul 2>&1

:: 3. Mematikan Microsoft Account Sign-in Assistant (Aman untuk Local Account)
echo [+] Menghentikan Microsoft Account Sign-in Assistant...
sc stop wlidsvc >nul 2>&1
sc config wlidsvc start= disabled >nul 2>&1

:: 4. Mematikan Telemetry & Pengumpulan Data Microsoft
echo [+] Menghentikan Connected User Experiences (Telemetry)...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1

:: 5. Mematikan Windows Error Reporting
echo [+] Menghentikan Windows Error Reporting Service...
sc stop WerSvc >nul 2>&1
sc config WerSvc start= disabled >nul 2>&1

:: 6. Mematikan Distributed Link Tracking Client
echo [+] Menghentikan Distributed Link Tracking Client...
sc stop TrkWks >nul 2>&1
sc config TrkWks start= disabled >nul 2>&1

:: 7. Mematikan Manajer Peta Offline Windows
echo [+] Menghentikan Downloaded Maps Manager...
sc stop MapsBroker >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1

:: 8. Tweak Registry untuk Mempercepat Respon Windows
echo [+] Mengoptimalkan kecepatan respon visual Windows...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1

:: 9. Mematikan Cortana Background Service
echo [+] Mematikan Asisten Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

:: 10. Mematikan Fitur Pengganggu Sticky Keys
echo [+] Mematikan Sticky Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1

:: 11. Pembersihan File Log Tambahan (Versi Cepat & Aman)
echo [+] Membersihkan sisa file *.log dan *.bak di folder utama...
del /f /q %systemdrive%\*.log >nul 2>&1
del /f /q %systemdrive%\*.bak >nul 2>&1
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1
del /f /s /q "C:\Windows\panther\*" >nul 2>&1

echo.
echo ===================================================
echo             SEMUA SERVIS BERHASIL DIMATIKAN!
echo ===================================================
echo.
echo Tekan tombol apa saja untuk keluar...
pause >nul