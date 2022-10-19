@echo off
powershell -Command "Set-ExecutionPolicy Bypass -Scope CurrentUser"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alexciao/UnityInstaller/main/unity.ps1 -OutFile unity.ps1"
powershell -Command ".\unity.ps1"