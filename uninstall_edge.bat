@echo off
:: Judul Jendela Command Prompt
title Paksa Uninstall & Block Microsoft Edge

:: -------------------------------------------------------------------------
:: OTOMATIS MEMINTA AKSES ADMINISTRATOR
:: -------------------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :MulaiUninstall
) else (
    echo Meminta hak akses Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MulaiUninstall
cls
echo ===================================================
echo    PAKSA UNINSTALL & SAPU BERSIH MICROSOFT EDGE
echo ===================================================
echo.

:: 1. Hentikan paksa proses Edge yang sedang berjalan di background
echo [+] Menghentikan paksa proses Edge di background...
taskkill /f /im msedge.exe >nul 2>&1

:: 2. Jalankan uninstaller bawaan (Taktik Pertama)
echo [+] Menjalankan uninstaller resmi bawaan...
cd /d "C:\Program Files (x86)\Microsoft\Edge\Application" 2>nul
for /d %%i in (*) do (
    if exist "%%i\Installer\setup.exe" (
        cd /d "%%i\Installer"
        setup.exe --uninstall --force-uninstall --system-level >nul 2>&1
    )
)

:: 3. Hancurkan folder instalasi Edge (Biarpun dikunci, kita ambil alih)
echo [+] Menghapus sisa folder inti Edge di Program Files...
taskkill /f /im msedge.exe >nul 2>&1
timeout /t 2 /nobreak >nul
rmdir /s /q "C:\Program Files (x86)\Microsoft\Edge" >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\Microsoft\EdgeCore" >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView" >nul 2>&1

:: 4. Matikan servis update otomatis milik Edge agar tidak balik lagi
echo [+] Mematikan servis Edge Update...
sc stop edgeupdate >nul 2>&1
sc config edgeupdate start= disabled >nul 2>&1
sc stop edgeupdatem >nul 2>&1
sc config edgeupdatem start= disabled >nul 2>&1

:: 5. Bersihkan shortcut ikon yang tersisa
echo [+] Membersihkan shortcut ikon di Desktop...
del /f /q "%public%\Desktop\Microsoft Edge.lnk" >nul 2>&1
del /f /q "%userprofile%\Desktop\Microsoft Edge.lnk" >nul 2>&1

echo.
echo ===================================================
echo          MICROSOFT EDGE BERHASIL DIHAPUS!
echo ===================================================
echo.
echo Tekan tombol apa saja untuk keluar...
pause >nul