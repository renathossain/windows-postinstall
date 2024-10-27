# windows-postinstall

Install the most common apps and make the most common customizations on Windows 11.

1. Open Powershell with Administrator privileges.
2. First allow the execution of powershell scripts using this command:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

3. Then, run the postinstaller using this command:

```
.\postinstall.ps1
```
