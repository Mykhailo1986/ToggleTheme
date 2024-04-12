<#
.SYNOPSIS
    This script allows you to toggle between light and dark themes on Windows and change the desktop wallpaper.
.DESCRIPTION
    This PowerShell script enables users to switch between light and dark themes and update the wallpaper accordingly.
    The script retrieves theme settings from the Windows registry and changes the wallpaper based on the selected theme.
.NOTES
    Script name: ToggleTheme.ps1
    Author: Mykhailo Kucher
	Email: I_am_Misha@i.ua
    Date created: 12.02.2024
    Copyright: (c) 2024 Mykhailo Kucher. All rights reserved.
    Version: 1.0
#>


# You can change your WallPapers here:
$DarkWallPaper =  "c:\windows\web\wallpaper\theme1\img13.jpg"
$LightWallpaper = "c:\windows\web\wallpaper\theme1\img2.jpg"


# Function to set the wallpaper of the desktop
function Set-Wallpaper {
    param (
        [string]$ImagePath  # The path to the image file
    )

    # Import the SystemParametersInfo function from user32.dll
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
    # Call SystemParametersInfo to change the wallpaper
    [Wallpaper]::SystemParametersInfo(20, 0, $ImagePath, 3)
}


# Function to toggle between light and dark themes
function ToggleTheme {
    $theme = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -ErrorAction SilentlyContinue
    if ($theme -eq $null) {
        Write-Host "Unable to retrieve the current theme."
        return
    }

    if ($theme.AppsUseLightTheme -eq 0) {
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 1
		Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 1
		Set-Wallpaper -ImagePath $LightWallPaper		
        Write-Host "The theme changed to Light."
    }
    else {
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0
		Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0
		Set-Wallpaper -ImagePath $DarkWallPaper
        Write-Host "The theme changed to Dark."
    }

    # Restart Windows Explorer for new theme
    # Stop-Process -Name explorer -Force
}


# Call the ToggleTheme function to switch between themes
ToggleTheme
