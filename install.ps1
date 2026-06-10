 
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
  
  # Download menggunakan curl (ditambahkan -k untuk jaga-jaga)
  curl.exe -L -k $url -o $file
  
  if (Test-Path $file) {
      $fileSize = (Get-Item $file).Length
      # Cek apakah file terdownload dengan benar (di atas 1 MB)
      if ($fileSize -gt 1000000) { 
          Write-Host "Download sukses! Menjalankan installer Chrome..." -ForegroundColor Green
          Start-Process $file
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

    "0" {
        Write-Host "Keluar dari installer..."
    }

    default {
        Write-Host "Pilihan tidak valid"
        Start-Sleep 2
    }
}

} while ($choice -ne "0")
