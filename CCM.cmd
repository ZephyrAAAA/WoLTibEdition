@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cd %~dp0
for /f "delims=" %%i in ('dir /b ^| find /V "SC2Mod"') do (
	cd "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
	rem del /q %%i
	rem mklink %%i %~dp0\%%i
	echo %cd%\%%i %~dp0\%%i
)
cd %~dp0
for /f "delims=" %%i in ('dir /b ^| find "SC2Mod"') do (
	cd "C:\Program Files (x86)\StarCraft II\Mods"
	rem rmdir /s /q "%%i"
	rem mklink /d %%i "%~dp0\%%i"
	echo %cd%\%%i %~dp0\%%i
)
pause