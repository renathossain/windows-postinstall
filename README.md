# windows-postinstall

Install the most common apps and make the most common customizations on Windows 11.

First allow the execution of powershell scripts using this command:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then, run the postinstaller using this command:

```
.\postinstall.ps1
```
