 
# function Install-Chrome {
#     Write-Host "Downloading Google Chrome..."
    
#     # URL file installer yang disimpan di GitHub
#     $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/Chrome.msi"
#     $file = "$env:TEMP\Chrome.msi"

#     # Download installer
#     Invoke-WebRequest $url -OutFile $file

#     Write-Host "Installing Google Chrome..."
#     Start-Process $file -ArgumentList "/silent /install" -Wait -WindowStyle Hidden

#     # Hapus file installer setelah selesai
#     Remove-Item $file
# }

function Install-Chrome {
    Write-Host "Downloading Chrome..."
  
    # Jalur RAW resmi untuk mengambil file asli dari repositori kamu
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/Chrome.exe"
    $file = "$env:USERPROFILE\Downloads\ChromeSetup.exe"
  
    # Hapus file sisa percobaan sebelumnya jika ada
    if (Test-Path $file) { Remove-Item $file -Force }
  
    # Download menggunakan curl
    curl.exe -L -k $url -o $file
  
    if (Test-Path $file) {
        $fileSize = (Get-Item $file).Length
        # Cek apakah file terdownload dengan benar (di atas 1 MB)
        if ($fileSize -gt 1000000) { 
            Write-Host "Download sukses! Menjalankan installer Chrome..." -ForegroundColor Green
            
            # PERBAIKAN DI SINI: Ditambahkan -Wait agar skrip menunggu Chrome selesai terinstal
            Start-Process $file -Wait
            
            # Opsional: Hapus file installer setelah selesai agar folder Downloads tetap bersih
            Remove-Item $file -Force
        } else {
            Write-Error "File yang terunduh terlalu kecil ($fileSize bytes). Link Raw kemungkinan salah atau diblokir."
        }
    } else {
        Write-Error "Gagal mengunduh file dari GitHub."
    }
}

function Install-Firefox {
    Write-Host "Downloading Firefox..."
    
    # URL file installer yang disimpan di GitHubb
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/Firefox.exe"
    $file = "$env:TEMP\Firefox.exe"

    # Download installer
    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing Firefox..."
    Start-Process $file -ArgumentList "/silent /install" -Wait -WindowStyle Hidden

    # Hapus file installer setelah selesai
    Remove-Item $file
}

function Install-Adobe {
    Write-Host "Downloading Adobe Reader 9..."
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/AdobeReader9.exe"
    $file = "$env:TEMP\AdobeReader9.exe"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing Adobe Reader 9..."
    Start-Process $file -ArgumentList "/sAll /rs /msi /qn" -Wait -WindowStyle Hidden

    Remove-Item $file
}

function Install-7zip {
    Write-Host "Downloading 7-Zip..."
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/7Zip.exe"
    $file = "$env:TEMP\7Zip.exe"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing 7-Zip..."
    Start-Process $file -ArgumentList "/S" -Wait -WindowStyle Hidden

    # Hapus file installer setelah selesai
    Remove-Item $file
}

function Install-WinRAR {
    Write-Host "Downloading WinRAR..."

    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/Winrar.exe"
    $file = "$env:TEMP\Winrar.exe"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing WinRAR silently..."

    Start-Process $file -ArgumentList "/S" -Wait -WindowStyle Hidden

    Write-Host "Cleaning up..."
    Remove-Item $file -Force
}
function Open-Drive {

    $url = "https://drive.google.com/drive/folders/1larcYLCHDAJNKEsDC0L2jVfd_xcJEcCc?usp=drive_link"

    Write-Host "Membuka Google Drive..."

    Start-Process "rundll32.exe" "url.dll,FileProtocolHandler $url"

}

function Run-BatTool {

    Write-Host "Downloading BAT tool..."

    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/disableupdate.bat"
    $file = "$env:TEMP\disableupdate.bat"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Running BAT tool..."

    Start-Process $file -Wait
}

function Run-stopHotspot {

    Write-Host "Downloading BAT tool..."

    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/StopHostpot.bat"
    $file = "$env:TEMP\StopHostpot.bat"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Running BAT tool as Administrator..."

    Start-Process $file -Verb RunAs -Wait
}

function Run-optimasiservis {

      Write-Host "Sedang Download BAT tool..." -ForegroundColor Cyan
         
      $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/optimasi_servis.bat"
      
      # SOLUSI: Simpan di folder netral (C:\Windows\optimasi_servis.bat), jangan di $env:TEMP!
      $file = "C:\Windows\optimasi_servis.bat"
      
      if (Test-Path $file) { Remove-Item $file -Force }
      
      curl.exe -L -k $url -o $file
      
      if (Test-Path $file) {
          Write-Host "Running BAT tool as Administrator..." -ForegroundColor Green
          
          Start-Process $file -Verb RunAs -Wait
          
          # Hapus setelah selesai
          Remove-Item $file -Force
          Write-Host "Aktivasi Windows Berhasil" -ForegroundColor Green
      } else {
          Write-Error "Gagal mengunduh file clear.bat."
      }
}

function Run-uninstalledge {

      Write-Host "Sedang Download BAT tool..." -ForegroundColor Cyan
         
      $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/uninstall_edge.bat"
      
      # SOLUSI: Simpan di folder netral (C:\Windows\uninstall_edge.bat), jangan di $env:TEMP!
      $file = "C:\Windows\uninstall_edge.bat"
      
      if (Test-Path $file) { Remove-Item $file -Force }
      
      curl.exe -L -k $url -o $file
      
      if (Test-Path $file) {
          Write-Host "Running BAT tool as Administrator..." -ForegroundColor Green
          
          Start-Process $file -Verb RunAs -Wait
          
          # Hapus setelah selesai
          Remove-Item $file -Force
          Write-Host "Uninstall Edge Berhasil" -ForegroundColor Green
      } else {
          Write-Error "Gagal mengunduh file clear.bat."
      }
}

function Run-clearsampah {

      Write-Host "Sedang Download BAT tool..." -ForegroundColor Cyan
         
      $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/clear.bat"
      
      # SOLUSI: Simpan di folder netral (C:\Windows\clear.bat), jangan di $env:TEMP!
      $file = "C:\Windows\clear.bat"
      
      if (Test-Path $file) { Remove-Item $file -Force }
      
      curl.exe -L -k $url -o $file
      
      if (Test-Path $file) {
          Write-Host "Running BAT tool as Administrator..." -ForegroundColor Green
          
          Start-Process $file -Verb RunAs -Wait
          
          # Hapus setelah selesai
          Remove-Item $file -Force
          Write-Host "Semua pembersihan (Windows Temp, User Temp, & Prefetch) sukses!" -ForegroundColor Green
      } else {
          Write-Error "Gagal mengunduh file clear.bat."
      }
}

function Run-WindowsModule {
    Clear-Host
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host "          INFORMASI LISENSI WINDOWS SAAT INI       " -ForegroundColor Cyan
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""

    # 1. Menampilkan info lisensi utama
    cscript //nologo $env:SystemRoot\system32\slmgr.vbs /dli | Select-String "Name:","Description:","License Status:","KMS machine" | ForEach-Object { Write-Host $_.Line }
    
    # PERBAIKAN DI SINI: Menampilkan teks tanggal kedaluwarsa asli dari slmgr /xpr
    cscript //nologo $env:SystemRoot\system32\slmgr.vbs /xpr | Select-String "expiry", "expire", "permanently", "kedaluwarsa" | ForEach-Object { Write-Host $_.Line -ForegroundColor Green }
    
    Write-Host ""
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""

    # Cek status aktif
    $isLicensed = cscript //nologo $env:SystemRoot\system32\slmgr.vbs /dli | Select-String "License Status: Licensed"
    
    if ($isLicensed) {
        Write-Host "[PEMBERITAHUAN] Windows di PC ini terdeteksi SUDAH AKTIF." -ForegroundColor Yellow
        Write-Host "Silakan lihat informasi masa aktif di atas sebelum memutuskan."
        Write-Host ""
        Write-Host "[1] Tetap paksa aktivasi ulang lewat KMS (Timpa lisensi)"
        Write-Host "[2] Kembali ke Menu Utama"
        Write-Host ""
        $konfirmasi = Read-Host "Masukkan pilihan kamu (1/2)"
        if ($konfirmasi -ne "1") { Show-MainMenu; return }
    }

    # Proses Aktivasi Windows
    Clear-Host
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host "         MEMULAI AKTIVASI WINDOWS 10/11 PRO        " -ForegroundColor Cyan
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[!] Pastikan PC terhubung ke Internet..." -ForegroundColor Yellow
    Write-Host ""

    Write-Host "[+] Menanamkan Lisensi KMS Pro..." -ForegroundColor Gray
    slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX *>$null

    Write-Host "[+] Menghubungkan ke Server KMS..." -ForegroundColor Gray
    slmgr /skms kms8.msguides.com *>$null

    Write-Host "[+] Memproses aktivasi online..." -ForegroundColor Gray
    cscript //nologo $env:SystemRoot\system32\slmgr.vbs /ato *>$null

    Write-Host "---------------------------------------------------"
    Write-Host "[+] Memeriksa status hasil aktivasi akhir..."
    Write-Host "---------------------------------------------------"

    $statusAkhir = cscript //nologo $env:SystemRoot\system32\slmgr.vbs /dli | Select-String "License Status: Licensed"
    if ($statusAkhir) {
        Write-Host "[SUKSES] Windows 10/11 Pro BERHASIL DIAKTIVASI!" -ForegroundColor Green
    } else {
        Write-Host "[GAGAL] Windows belum berhasil diaktivasi." -ForegroundColor Red
        Write-Host "Solusi: Periksa koneksi internet atau server KMS sedang down."
    }

    Read-Host "`nTekan Enter untuk kembali ke Menu Utama..."
    Show-MainMenu
}

function Run-OfficeModule {
    Clear-Host
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host "        MENCARI INSTALASI MICROSOFT OFFICE...      " -ForegroundColor Cyan
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""

    $officeFolders = @(
        "$env:ProgramFiles\Microsoft Office\Office16",
        "${env:ProgramFiles(x86)}\Microsoft Office\Office16",
        "$env:ProgramFiles\Microsoft Office\Office15",
        "${env:ProgramFiles(x86)}\Microsoft Office\Office15",
        "$env:ProgramFiles\Microsoft Office\Office14",
        "${env:ProgramFiles(x86)}\Microsoft Office\Office14"
    )

    $officePath = $null
    foreach ($folder in $officeFolders) {
        if (Test-Path "$folder\ospp.vbs") {
            $officePath = $folder
            break
        }
    }

    if ($null -eq $officePath) {
        Write-Host "[X] ERROR: Microsoft Office TIDAK TERDETEKSI di komputer ini!" -ForegroundColor Red
        Read-Host "`nTekan Enter untuk kembali ke Menu Utama..."
        Show-MainMenu
        return
    }

    Set-Location $officePath
    Write-Host "[+] Ditemukan folder Office pada:" -ForegroundColor Gray
    Write-Host "    `"$officePath`"" -ForegroundColor DarkGray
    Write-Host "---------------------------------------------------"
    Write-Host "          INFORMASI LISENSI OFFICE SAAT INI        " -ForegroundColor Cyan
    Write-Host "---------------------------------------------------"

    # PERBAIKAN DI SINI: Menggunakan pola regex agar findstr/Select-String lebih fleksibel membaca huruf besar/kecil
    cscript //nologo ospp.vbs /dstatus | Select-String "NAME:", "DESCRIPTION:", "STATUS:", "ERROR CODE:" | ForEach-Object { Write-Host $_.Line }
    
    # Menangkap sisa hari aktif baik huruf besar maupun kecil
    cscript //nologo ospp.vbs /dstatus | Select-String "REMAINING GRACE", "remaining grace" | ForEach-Object { Write-Host $_.Line -ForegroundColor Green }

    Write-Host ""
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""

    $officeAktif = cscript //nologo ospp.vbs /dstatus | Select-String "LICENSED"

    if ($officeAktif) {
        Write-Host "[PEMBERITAHUAN] Office di PC ini terdeteksi SUDAH AKTIF (LICENSED)." -ForegroundColor Yellow
        Write-Host ""
        Write-Host "[1] Tetap paksa aktivasi ulang lewat KMS (Timpa lisensi)"
        Write-Host "[2] Kembali ke Menu Utama"
        Write-Host ""
        $konfirmasi = Read-Host "Masukkan pilihan kamu (1/2)"
        if ($konfirmasi -ne "1") { Show-MainMenu; return }
    }

    # Proses Aktivasi Office
    Clear-Host
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host "           MEMULAI AKTIVASI ONLINE OFFICE          " -ForegroundColor Cyan
    Write-Host "===================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[!] Pastikan PC terhubung ke Internet..." -ForegroundColor Yellow
    Write-Host ""

    Write-Host "[+] Menghubungkan ke Server KMS..." -ForegroundColor Gray
    cscript //nologo ospp.vbs /sethst:kms8.msguides.com *>$null

    Write-Host "[+] Memproses aktivasi online..." -ForegroundColor Gray
    cscript //nologo ospp.vbs /act *>$null

    Write-Host "---------------------------------------------------"
    Write-Host "[+] Memeriksa status hasil aktivasi akhir..."
    Write-Host "---------------------------------------------------"

    $statusAkhir = cscript //nologo ospp.vbs /dstatus | Select-String "LICENSED"
    if ($statusAkhir) {
        Write-Host "[SUKSES] Microsoft Office BERHASIL DIAKTIVASI!" -ForegroundColor Green
    } else {
        Write-Host "[GAGAL] Office belum berhasil diaktivasi." -ForegroundColor Red
        Write-Host "Solusi: Cek koneksi internet atau convert Office ke Volume (KMS) Edition dahulu."
    }

    Read-Host "`nTekan Enter untuk kembali ke Menu Utama..."
    Show-MainMenu
}
function Install-Office2010 {
    <#
    .SYNOPSIS
        Mengunduh, mengekstrak, dan menginstal Microsoft Office 2010 secara interaktif.
    #>
    
    # 1. KONFIGURASI AWAL & PROTOKOL KEAMANAN
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    # Simpan folder aktif saat ini agar setelah instalasi selesai, posisi folder user tidak berubah
    $originalLocation = Get-Location
    cd $home\Downloads

    $url = "https://github.com/Akuhasann/windows-auto-installer/releases/download/v1.0/OFFICE2010x64.rar"
    $rarFile = "$home\Downloads\OFFICE2010x64.rar"
    $extractFolder = "$env:TEMP\Office2010Installer"

    # 2. PROSES DOWNLOAD DARI GITHUB RELEASES
    Write-Host "==================================================" -ForegroundColor Gray
    Write-Host "1. Memulai Unduhan Office 2010 dari GitHub..." -ForegroundColor Cyan
    Write-Host "==================================================" -ForegroundColor Gray

    try {
        if (!(Test-Path $rarFile)) {
            Invoke-WebRequest -Uri $url -OutFile $rarFile -ErrorAction Stop
            Write-Host "Unduhan Selesai!" -ForegroundColor Green
        } else {
            Write-Host "File .rar sudah ada di folder Downloads, melewati proses unduh." -ForegroundColor Yellow
        }
    } 
    catch {
        Write-Host "`nGagal dalam proses unduhan!" -ForegroundColor Red
        Write-Host "Pesan Error: $_" -ForegroundColor Yellow
        cd $originalLocation # Kembalikan lokasi folder sebelum keluar
        return # Keluar dari function karena file tidak ada
    }

    # 3. PROSES EKSTRAK MENGGUNAKAN WINRAR
    Write-Host "`n==================================================" -ForegroundColor Gray
    Write-Host "2. Mengekstrak File via WinRAR..." -ForegroundColor Cyan
    Write-Host "==================================================" -ForegroundColor Gray

    if (Test-Path "C:\Program Files\WinRAR\WinRAR.exe") {
        if (!(Test-Path $extractFolder)) { New-Item -ItemType Directory -Path $extractFolder | Out-Null }
        
        Start-Process "C:\Program Files\WinRAR\WinRAR.exe" -ArgumentList "x `"$rarFile`" * `"$extractFolder\`" -ibck -y" -Wait
        Write-Host "Ekstrak Selesai!" -ForegroundColor Green

        # 4. PROSES INSTALASI (MUNCUL JENDELA / INTERAKTIF)
        Write-Host "`n==================================================" -ForegroundColor Gray
        Write-Host "3. Membuka Jendela Instalasi Office 2010..." -ForegroundColor Cyan
        Write-Host "==================================================" -ForegroundColor Gray
        
        if (Test-Path "$extractFolder\setup.exe") {
            Write-Host "Silakan selesaikan instalasi pada jendela Microsoft Office yang muncul." -ForegroundColor Yellow
            
            Start-Process "$extractFolder\setup.exe" -Wait
            
            # 5. PEMBERSIHAN OTOMATIS FOLDER TEMPORARY
            Write-Host "`nJendela instalasi ditutup. Melakukan pembersihan..." -ForegroundColor Cyan
            Remove-Item $extractFolder -Recurse -Force
            
            Write-Host "`n[SUKSES] Seluruh proses unduh, ekstrak, dan instalasi selesai!" -ForegroundColor Green
        } else {
            Write-Host "Error: File 'setup.exe' tidak ditemukan di hasil ekstrak!" -ForegroundColor Red
        }
    } else {
        Write-Host "Error: Aplikasi WinRAR tidak ditemukan di 'C:\Program Files\WinRAR\WinRAR.exe'!" -ForegroundColor Red
        Write-Host "Silakan install WinRAR terlebih dahulu atau ekstrak file secara manual." -ForegroundColor Yellow
    }

    # Kembalikan posisi folder aktif PowerShell ke tempat semula sebelum function dipanggil
    cd $originalLocation
}
do {

Clear-Host

Write-Host "====================================="
Write-Host " WINDOWS AUTO INSTALLER"
Write-Host "====================================="
Write-Host ""

Write-Host "1. Install Google Chrome"
Write-Host "2. Install Mozilla Firefox"
Write-Host "3. Install Adobe Reader 9"
Write-Host "4. Install 7-Zip"
Write-Host "5. Install WinRAR"
Write-Host "6. Install Semua"
Write-Host "7. Download dari Google Drive"
Write-Host "8. Matikan Update Windows"
Write-Host "9. Matikan Hostpot"
Write-Host "10. Clear Sampah"
Write-Host "11. Optimasi Servis"
Write-Host "12. Uninstall Edge"
Write-Host "13. Aktivasi Windows"
Write-Host "14. Aktivasi Office"
Write-Host "15. Install Office 2010"
Write-Host "0. Exit"
Write-Host ""

$choice = Read-Host "Pilih nomor"

switch ($choice) {

    "1" { Install-Chrome }

    "2" { Install-Firefox }

    "3" { Install-Adobe }

    "4" { Install-7zip }

    "5" { Install-WinRAR }

    "6" {
        Install-Chrome
        Install-Firefox
        Install-Adobe
        Install-7zip
        Install-WinRAR
    }

    "7" { Open-Drive }

    "8" { Run-BatTool }
    
    "9" { Run-stopHotspot }

    "10" { Run-clearsampah }

    "11" { Run-optimasiservis }

    "12" { Run-uninstalledge }

    "13" { Run-WindowsModule }

    "14" { Run-OfficeModule }

    "15" { Install-Office2010 }

    "0" {
        Write-Host "Keluar dari installer..."
    }

    default {
        Write-Host "Pilihan tidak valid"
        Start-Sleep 2
    }
}

} while ($choice -ne "0")
