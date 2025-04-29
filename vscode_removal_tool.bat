@echo off
cls
color 0A

echo ====================================
echo        Elswah Augment Tool
echo ====================================
echo.
echo Please select an option:
echo 1. Remove VS Code
echo 2. Remove VS Code Insiders
echo 3. Exit
echo.

:menu
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" goto remove_vscode
if "%choice%"=="2" goto remove_vscode_insider
if "%choice%"=="3" goto exit
goto menu

:remove_vscode
echo.
echo Removing VS Code...
if exist "%LocalAppData%\Programs\Microsoft VS Code\unins000.exe" (
    "%LocalAppData%\Programs\Microsoft VS Code\unins000.exe" /SILENT
)
rd /s /q "%APPDATA%\Code"
rd /s /q "%USERPROFILE%\.vscode"
powershell -Command "$path = [Environment]::GetEnvironmentVariable('Path', 'User'); if ($path) { $newPath = ($path.Split(';') | Where-Object { $_ -and ($_ -notmatch 'VS Code(?! Insiders)') }) -join ';'; [Environment]::SetEnvironmentVariable('Path', $newPath, 'User') }"
echo VS Code has been removed!
pause
goto menu

:remove_vscode_insider
echo.
echo Removing VS Code Insiders...
if exist "%LocalAppData%\Programs\Microsoft VS Code Insiders\unins000.exe" (
    "%LocalAppData%\Programs\Microsoft VS Code Insiders\unins000.exe" /SILENT
)
rd /s /q "%APPDATA%\Code - Insiders"
rd /s /q "%USERPROFILE%\.vscode-insiders"
powershell -Command "$path = [Environment]::GetEnvironmentVariable('Path', 'User'); if ($path) { $newPath = ($path.Split(';') | Where-Object { $_ -and ($_ -notmatch 'VS Code Insiders') }) -join ';'; [Environment]::SetEnvironmentVariable('Path', $newPath, 'User') }"
echo VS Code Insiders has been removed!
pause
goto menu

:exit
echo.
echo Thank you for using Elswah Augment Tool!
timeout /t 3
exit