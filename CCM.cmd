@echo off
net session >nul 2>&1
if %errorlevel%==2 powershell -noprofile -command "&{ start-process '%~f0' -verb RunAs}" && exit
cd /d %~dp0
for /f "delims=" %%i in ('dir /b ^| find /V "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
	del /q "%%i"
	mklink "%%i" "%~dp0\%%i"
)
cd /d %~dp0
for /f "delims=" %%i in ('dir /b ^| find "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Mods"
	rmdir /s /q "%%i"
	mklink /d "%%i" "%~dp0\%%i"
)
pause