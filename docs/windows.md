# Personalization
These must be run in PowerShell as an <u>Administrator</u>

### Restore old right-click menu in Windows 11
```shell
# Restore old right-click menu in Windows 11
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
# Restart Windows Explorer
Stop-Process -Name explorer -Force
Start-Process explorer
```
