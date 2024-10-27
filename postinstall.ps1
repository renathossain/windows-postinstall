# PowerShell Script to Install Common Software using Winget on Windows 11
# Run this script in PowerShell with Administrator privileges

# Check if winget is installed
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "Winget is not available on this system. Please ensure your Windows 11 is updated to the latest version."
    exit
}

# List of applications to install with elevated permissions
$elevatedApps = @(
    @{Name = "Google Chrome"; Package = "Google.Chrome"},
    @{Name = "Visual Studio Code"; Package = "Microsoft.VisualStudioCode"},
    @{Name = "7-Zip"; Package = "7zip.7zip"},
    @{Name = "Zoom"; Package = "Zoom.Zoom"},
    @{Name = "Slack"; Package = "SlackTechnologies.Slack"},
    @{Name = "Git"; Package = "Git.Git"}
)

# List of applications to install without elevated permissions
$nonElevatedApps = @(
    @{Name = "VLC Media Player"; Package = "VideoLAN.VLC"},
    @{Name = "Spotify"; Package = "Spotify.Spotify"}
)

# Function to check if an application is installed
function Is-AppInstalled {
    param (
        [string]$appId
    )
    $installed = winget list --id $appId -q | Select-String -Pattern $appId
    return $installed -ne $null
}

# Install each application with elevated permissions
foreach ($app in $elevatedApps) {
    if (Is-AppInstalled -appId $app.Package) {
        Write-Output "$($app.Name) is already installed. Skipping..."
    } else {
        Write-Output "Installing $($app.Name) with elevated permissions..."
        winget install --id $($app.Package) --silent --accept-package-agreements --accept-source-agreements
        if ($?) {
            Write-Output "$($app.Name) installed successfully."
        } else {
            Write-Output "Failed to install $($app.Name)."
        }
    }
}

# Install each application without elevated permissions
foreach ($app in $nonElevatedApps) {
    if (Is-AppInstalled -appId $app.Package) {
        Write-Output "$($app.Name) is already installed. Skipping..."
    } else {
        Write-Output "Installing $($app.Name) without elevated permissions..."
        Start-Process -FilePath "winget" -ArgumentList "install --id $($app.Package) --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow
    }
}

Write-Output "All installations completed."
