Write-Host "====================================="
Write-Host " WINDOWS AUTO INSTALLER"
Write-Host "====================================="
Write-Host ""

Write-Host "1. Install Google Chrome"
Write-Host "2. Install Mozilla Firefox"
Write-Host "3. Install Adobe Reader 9"
Write-Host "4. Install 7-Zip"
Write-Host "5. Install WinRAR (Indonesia)"
Write-Host "6. Install Semua"
Write-Host ""

$choice = Read-Host "Pilih nomor"

function Install-Chrome {
    Write-Host "Installing Chrome..."
    winget install -e --id Google.Chrome --silent --accept-package-agreements --accept-source-agreements
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

    default { Write-Host "Pilihan tidak valid" }

}

Write-Host ""
Write-Host "Install selesai!"