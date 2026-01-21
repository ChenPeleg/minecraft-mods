@echo off
REM build.bat - build the example-loom Gradle project and copy artifacts to output/

REM Save the directory of this script (includes trailing backslash)
SETLOCAL
set ROOT_DIR=%~dp0

pushd "%ROOT_DIR%example-loom" 2>nul || (
  echo Failed to change directory to "%ROOT_DIR%example-loom". Ensure the folder exists.
  ENDLOCAL
  exit /b 1
)

if exist ".\gradlew.bat" (
  echo Running Gradle wrapper in example-loom...
  call ".\gradlew.bat" build %*
) else (
  echo gradlew.bat not found in example-loom. Attempting to run "gradlew" from PATH...
  call gradlew build %*
)

popd

REM Ensure output directory exists at repository root
if not exist "%ROOT_DIR%output" (
  mkdir "%ROOT_DIR%output"
)

echo Copying build artifacts to output folder...

REM Copy any jars from build/libs (common Gradle output)
if exist "%ROOT_DIR%example-loom\build\libs\*" (
  copy /Y "%ROOT_DIR%example-loom\build\libs\*" "%ROOT_DIR%output\" >nul 2>&1
)

REM Also copy remapped jars from Loom's remapped_working cache if present
@REM if exist "%ROOT_DIR%example-loom\build\loom-cache\remapped_working\*" (
@REM   copy /Y "%ROOT_DIR%example-loom\build\loom-cache\remapped_working\*" "%ROOT_DIR%output\" >nul 2>&1
@REM )

echo Done. Artifacts (if any) are in "%ROOT_DIR%output".
ENDLOCAL
exit /b %ERRORLEVEL%
