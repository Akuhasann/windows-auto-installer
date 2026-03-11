Write-Host "====================================="
Write-Host " WINDOWS AUTO INSTALLER"
Write-Host "====================================="
Write-Host ""

$installer = ".\apps\Adobe Reader 9.exe"

if (Test-Path $installer) {

    Write-Host "Installing Adobe Reader 9..."

    Start-Process $installer -Wait

    Write-Host "Install selesai!"

} else {

    Write-Host "File installer tidak ditemukan!"

}