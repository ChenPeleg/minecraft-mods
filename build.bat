@echo off
REM build.bat - build all Gradle projects and copy artifacts to output/

REM Save the directory of this script (includes trailing backslash)
SETLOCAL
set ROOT_DIR=%~dp0

echo Building all sub-projects...

if exist "%ROOT_DIR%gradlew.bat" (
  echo Running Gradle wrapper to build all projects...
  call "%ROOT_DIR%gradlew.bat" build %*
  if errorlevel 1 (
    echo Build failed!
    ENDLOCAL
    exit /b 1
  )
) else (
  echo gradlew.bat not found in root. Attempting to run "gradlew" from PATH...
  call gradlew build %*
  if errorlevel 1 (
    echo Build failed!
    ENDLOCAL
    exit /b 1
  )
)

REM Ensure output directory exists at repository root
if not exist "%ROOT_DIR%output" (
  mkdir "%ROOT_DIR%output"
  echo Created output directory
)

echo.
echo Copying build artifacts to output folder...

REM Copy jars from example-button
if exist "%ROOT_DIR%example-button\build\libs" (
  echo Copying artifacts from example-button...
  for %%f in ("%ROOT_DIR%example-button\build\libs\*.jar") do (
    copy /Y "%%f" "%ROOT_DIR%output\" >nul 2>&1
  )
)

REM Copy jars from example-loom
if exist "%ROOT_DIR%example-loom\build\libs" (
  echo Copying artifacts from example-loom...
  for %%f in ("%ROOT_DIR%example-loom\build\libs\*.jar") do (
    copy /Y "%%f" "%ROOT_DIR%output\" >nul 2>&1
  )
)

echo Done. Artifacts copied to "%ROOT_DIR%output".
dir "%ROOT_DIR%output\*.jar" 2>nul | find ".jar" >nul && (
  echo Files in output folder:
  dir "%ROOT_DIR%output\*.jar"
) || (
  echo No JAR files found in output folder.
)
ENDLOCAL
exit /b %ERRORLEVEL%
