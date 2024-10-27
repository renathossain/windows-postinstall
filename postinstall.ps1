# PowerShell Script to Install Common Software using Winget on Windows 11
# Run this script in PowerShell with Administrator privileges

# Check if winget is installed
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "Winget is not available on this system. Please ensure your Windows 11 is updated to the latest version."
    exit
}

# List of applications to install
$apps = @(
    @{Name = "Google Chrome"; Package = "Google.Chrome"},
    @{Name = "Visual Studio Code"; Package = "Microsoft.VisualStudioCode"},
    @{Name = "7-Zip"; Package = "7zip.7zip"},
    @{Name = "Spotify"; Package = "Spotify.Spotify"},
    @{Name = "Zoom"; Package = "Zoom.Zoom"},
    @{Name = "Slack"; Package = "SlackTechnologies.Slack"},
    @{Name = "Git"; Package = "Git.Git"}
)

# Install each application
foreach ($app in $apps) {
    Write-Output "Installing $($app.Name)..."
    winget install --id $($app.Package) --silent --accept-package-agreements --accept-source-agreements
    if ($?) {
        Write-Output "$($app.Name) installed successfully."
    } else {
        Write-Output "Failed to install $($app.Name)."
    }
}

# Install VLC in a non-elevated session
Write-Output "Installing VLC Media Player in a non-elevated session..."
Start-Process -FilePath "winget" -ArgumentList "install --id VideoLAN.VLC --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow

Write-Output "All installations completed."
