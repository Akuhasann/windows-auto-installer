Write-Host "================================="
Write-Host " WINDOWS AUTO INSTALLER"
Write-Host "================================="

$url = "https://raw.githubusercontent.com/Akuhasann/windows-auto-installer/main/apps/AdobeReader9.exe"
$file = "$env:TEMP\AdobeReader9.exe"

Write-Host "Downloading Adobe Reader 9..."

Invoke-WebRequest $url -OutFile $file

Write-Host "Installing Adobe Reader 9..."

Start-Process $file -Wait

Write-Host "Install selesai!"