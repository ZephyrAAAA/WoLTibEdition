@echo off
net session >nul 2>&1
if %errorlevel%==2 powershell -noprofile -command "&{ start-process '%~f0' -verb RunAs}" && exit
cd /d %~dp0
rem "C:\Program Files\7-Zip\7z.exe" a -mmt=8 -tzip tstory01.zip tstory01.SC2Map
for /f "delims=" %%i in ('dir /b ^| find /V "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
	del /q "%%i"
	mklink "%%i" "%~dp0\%%i"
)
del /q tstory01.SC2Map 2>nul
rmdir /s /q "tstory01.SC2Map"
cd /d %~dp0
mklink /d "tstory01.SC2Map" "%~dp0\tstory01.SC2Map"
cd /d "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
rem "C:\Program Files\7-Zip\7z.exe" e tstory01.zip
for /f "delims=" %%i in ('dir /b ^| find "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Mods"
	rmdir /s /q "%%i"
	mklink /d "%%i" "%~dp0\%%i"
)
cd /d %~dp0\tstory01.SC2Map\Base.SC2Data\GameData
del /q ConversationStateData.xml
mklink /h ConversationStateData.xml "%~dp0\WoLTibEdition.SC2Mod\Base.SC2Data\GameData\ConversationStateData.xml"
cd /d %~dp0\tstory01.SC2Map\enUS.SC2Data\LocalizedData
del /q GameStrings.txt
mklink /h GameStrings.txt "%~dp0\WoLTibEdition.SC2Mod\enUS.SC2Data\LocalizedData\GameStrings.txt"
pause