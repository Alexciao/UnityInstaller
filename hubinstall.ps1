$INSTALLER_URL = "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
$INSTALLER_ARGS = "/S"

$host.ui.RawUI.WindowTitle = "UnityInstaller"
Clear-Host

Write-Host "Download in corso..." -ForegroundColor White -BackgroundColor Blue

$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest $INSTALLER_URL -OutFile UnityHubSetup.exe

Write-Host "Download completato!" -ForegroundColor Black -BackgroundColor Green

try {
    Write-Host "Installazione in corso..." -ForegroundColor Black -BackgroundColor Yellow
    Start-Process UnityHubSetup.exe -ArgumentList $INSTALLER_ARGS -ea SilentlyContinue -Wait
    Clear-Host
    Write-Host "Installazione completata!" -ForegroundColor Black -BackgroundColor Green
} catch {
    Clear-Host
    Write-Host "Houston! Abbiamo un problema!" -ForegroundColor Black -BackgroundColor Red
    Write-Host "Non sono riuscito ad avviare l'installer." -ForegroundColor Black -BackgroundColor Red
    Start-Sleep -Seconds 1
    Remove-Item UnityHubSetup.exe
}

Write-Host "Lo script si chiudera' fra 3 secondi." -ForegroundColor White -BackgroundColor Blue
Start-Sleep -Seconds 3
Exit-PSHostProcess