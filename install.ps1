 
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
    Write-Host "Downloading Google Chrome..."
    
    # URL installer terbaru Chrome (offline installer)
    $url = "https://dl.google.com/chrome/install/375.126/chrome_installer.exe"
    $file = "$env:TEMP\Chrome.exe"

    # Download installer
    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing Google Chrome..."
    Start-Process $file -ArgumentList "/silent /install" -Wait -WindowStyle Hidden

    # Hapus file installer setelah selesai
    Remove-Item $file
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
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/7zip.exe"
    $file = "$env:TEMP\7zip.exe"

    Invoke-WebRequest $url -OutFile $file

    Write-Host "Installing 7-Zip..."
    Start-Process $file -ArgumentList "/silent /install" -Wait -WindowStyle Hidden

    # Hapus file installer setelah selesai
    Remove-Item $file
}

function Install-WinRAR {
    Write-Host "Downloading WinRAR..."
    $url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/WinRAR.exe"
    $file = "$env:TEMP\WinRAR.exe"

    Invoke-WebRequest $url -OutFile $file


    Write-Host "Installing WinRAR..."
    Start-Process $file -ArgumentList "/silent /install" -Wait -WindowStyle Hidden

    # Hapus file installer setelah selesai
    Remove-Item $file
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
Write-Host "8. Matikan Hostpot"
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
    
    "8" { Run-stopHotspot }

    "0" {
        Write-Host "Keluar dari installer..."
    }

    default {
        Write-Host "Pilihan tidak valid"
        Start-Sleep 2
    }
}

} while ($choice -ne "0")
