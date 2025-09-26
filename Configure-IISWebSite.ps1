param([string]$site1="mycartweb", [string]$site2="mycartapi",[string]$site3="mycartbgsvc")

# Exit on error
$ErrorActionPreference = "Stop"

# Install IIS
Write-Output "Installing IIS..."
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Create base folders and HTML pages
$sites = @(
    @{ Name = $site1; Port = 8081; Path = "C:\inetpub\mycartweb"; },
    @{ Name = $site2; Port = 8082; Path = "C:\inetpub\mycartapi"; },
    @{ Name = $site3; Port = 8083; Path = "C:\inetpub\mycartbgsvc"; }
)

foreach ($site in $sites) {
    $name = $site.Name
    $port = $site.Port
    $path = $site.Path

    Write-Output "Creating content folder: $path"
    New-Item -Path $path -ItemType Directory -Force

    Write-Output "Creating index.html for $name"
    Set-Content -Path "$path\index.html" -Value "<html><body><h1>Welcome to $name</h1></body></html>"

    Write-Output "Creating IIS website: $name on port $port"
    New-Website -Name $name -Port $port -PhysicalPath $path -Force
}

Write-Output "All websites created successfully!"
