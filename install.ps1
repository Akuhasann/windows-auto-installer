function Ensure-Winget {
    Write-Host "Checking winget..."

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "Winget tidak ditemukan, menginstall..."

        $wingetFile = "$env:TEMP\winget.msixbundle"

        Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile $wingetFile

        try {
            Add-AppxPackage $wingetFile -ErrorAction Stop

            # Refresh PATH
            $env:Path += ";$env:LOCALAPPDATA\Microsoft\WindowsApps"

            Start-Sleep 2

            if (Get-Command winget -ErrorAction SilentlyContinue) {
                Write-Host "Winget berhasil diinstall dan siap digunakan."
            } else {
                Write-Host "Winget terinstall tapi belum terdeteksi. Silakan restart PowerShell."
            }
        }
        catch {
            Write-Host "Gagal install winget. Kemungkinan butuh dependency."
        }
    }
    else {
        Write-Host "Winget sudah tersedia."
    }
}
function Install-Chrome {
    Write-Host "Installing Chrome..."

    if (Get-Command winget -ErrorAction SilentlyContinue) {
        winget install -e --id Google.Chrome --silent --accept-package-agreements --accept-source-agreements
    }
    else {
        Write-Host "Winget tidak tersedia, download manual..."

        $url = "https://www.google.com/chrome/download/latest/chrome/install.exe"
        $file = "$env:TEMP\chrome.exe"

        Invoke-WebRequest $url -OutFile $file
        Start-Process $file -ArgumentList "/silent /install" -Wait
    }
}

function Install-Firefox {
    Write-Host "Installing Firefox..."
    winget install -e --id Mozilla.Firefox --silent --accept-package-agreements --accept-source-agreements
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
    Write-Host "Installing 7-Zip..."
    winget install -e --id 7zip.7zip --silent --accept-package-agreements --accept-source-agreements
}

function Install-WinRAR {
    Write-Host "Installing WinRAR..."
    winget install -e --id RARLab.WinRAR --silent --accept-package-agreements --accept-source-agreements
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

Ensure-Winget
Start-Sleep 2
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

    "0" {
        Write-Host "Keluar dari installer..."
    }

    default {
        Write-Host "Pilihan tidak valid"
        Start-Sleep 2
    }
}

} while ($choice -ne "0")
