# Theme and Wallpaper Switcher Script

This PowerShell script allows you to toggle between light and dark themes on Windows, as well as change the desktop wallpaper.

## Prerequisites
- Windows operating system

## Usage
1. Download the script file (`ToggleTheme.ps1`) to your computer.
2. (Optional) Open the script file in a text editor of your choice.
   - Modify the `$DarkWallPaper` and `$LightWallpaper` variables to specify the paths to your dark and light wallpapers, respectively.
   - Save the changes to the script file.
3. Create a shortcut on your desktop for quick access:
   - Right-click on your desktop and select "New" > "Shortcut".
   - In the location field, enter the following command:
     ```
     powershell.exe -ExecutionPolicy RemoteSigned -File "<path to your script file>\ToggleTheme.ps1"
     ```
   - Click "Next", then provide a name for the shortcut and click "Finish".
4. (Optional) Customize the shortcut's icon:
   - Right-click on the shortcut and select "Properties".
   - Click on the "Change Icon" button and navigate to the location of your desired icon file (e.g., `ToggleTheme.ico`).
   - Select the desired icon and click "OK" to apply the changes.
5. Double-click the shortcut to run the script. You may be prompted to change the execution policy; choose "Yes" to allow the script to run.
6. The script will toggle between light and dark themes and update the wallpaper accordingly.

## Script Overview
- The script defines two functions:
  - `Set-Wallpaper`: Sets the wallpaper of the desktop to a specified image.
  - `ToggleTheme`: Toggles between light and dark themes and changes the wallpaper accordingly.
- The script retrieves the current theme settings from the Windows registry and toggles the `AppsUseLightTheme` value to switch between light and dark themes.
- The wallpaper is changed based on the theme selection using the `Set-Wallpaper` function.
- Upon execution, the script will automatically switch between light and dark themes and update the wallpaper.

## Notes
- Ensure that the specified wallpaper paths (`$DarkWallPaper` and `$LightWallpaper`) are valid and accessible.
- Run the script with administrator privileges to modify registry settings.
- Customize the script further to suit your specific needs.

## License



This post-processing script is licensed under the [MIT License](https://chat.openai.com/LICENSE). Feel free to modify and distribute it as per the terms of the license.

## Contact

If you have any questions, issues, or suggestions, please contact the project maintainer:

- Mykhailo Kucher
- LinkedIn https://www.linkedin.com/in/mykhailo-kucher
- Email: [I_am_Misha@i.ua](mailto:I_am_misha@i.ua)
- GitHub: [Mykhailo1986](https://github.com/Mykhailo1986)
