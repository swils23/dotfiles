# Personalization
These must be run in PowerShell as an <u>Administrator</u>: `Win+X, A`

### Restore old right-click menu in Windows 11
```shell
# Restore old right-click menu in Windows 11
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
# Restart Windows Explorer
Stop-Process -Name explorer -Force
Start-Process explorer
```


# WSL Setup
If you'd like to start fresh and have already installed WSL, you can reset it with the following command:
```powershell
wsl --unregister Ubuntu
```

These must be run in PowerShell as an <u>Administrator</u>: `Win+X, A`
```powershell
# Enable WSL and install default distro (Ubuntu)
wsl --install

```

# Removing WSL Ubuntu and starting fresh

```powershell
# Unregister Ubuntu
wsl --unregister Ubuntu
```

Uninstall Ubuntu from Settings > Apps > Installed Apps > Ubuntu

Optional: Disable WSL by going to `Control Panel > Programs > Turn Windows features on or off` and unchecking `Windows Subsystem for Linux` or running the following command:
```powershell
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
```