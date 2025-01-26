# windows-postinstall

Install the most common apps and make the most common customizations on Windows 11.

1. Open Powershell with Administrator privileges.
2. Install Chocolatey:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

3. Then, run the postinstaller using this command:

```
.\postinstall.ps1
```
