@echo off
REM Deploy mod to Minecraft mods folder

set MINECRAFT_MODS=%APPDATA%\.minecraft\mods
set OUTPUT_DIR=%~dp0output

echo Deploying mod to Minecraft...
echo Source: %OUTPUT_DIR%
echo Target: %MINECRAFT_MODS%
echo.

REM Check if output folder exists
if not exist "%OUTPUT_DIR%" (
    echo ERROR: Output folder does not exist!
    echo Please build the mod first.
    pause
    exit /b 1
)

REM Check if minecraft mods folder exists
if not exist "%MINECRAFT_MODS%" (
    echo ERROR: Minecraft mods folder not found at %MINECRAFT_MODS%
    echo Please make sure Minecraft is installed.
    pause
    exit /b 1
)

REM Copy JAR files (excluding sources)
echo Copying mod files...
for %%f in ("%OUTPUT_DIR%\*.jar") do (
    echo %%~nxf | findstr /i "sources" >nul
    if errorlevel 1 (
        echo Copying %%~nxf...
        copy /Y "%%f" "%MINECRAFT_MODS%\" >nul
        if errorlevel 1 (
            echo ERROR: Failed to copy %%~nxf
        ) else (
            echo Successfully copied %%~nxf
        )
    )
)

echo.
echo Deployment complete!
pause
