@echo off
net session >nul 2>&1
if %errorlevel%==2 powershell -noprofile -command "&{ start-process '%~f0' -verb RunAs}" && exit
cd /d %~dp0
for /f "delims=" %%i in ('dir /b /a:-d ^| find "SC2Map"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
	if exist %%i\ (
		rmdir "%%i"
	) else if exist %%i (
		del /q "%%i"
	)
	mklink "%%i" "%~dp0\%%i"
)
cd /d %~dp0
for /f "delims=" %%i in ('dir /b /a:d ^| find "SC2Map"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Maps\Campaign"
	if exist %%i\ (
		rmdir "%%i"
	) else if exist %%i (
		del "%%i"
	)
	mklink /d "%%i" "%~dp0\%%i"
)
cd /d %~dp0
for /f "delims=" %%i in ('dir /b /a:d ^| find "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Mods"
	rmdir "%%i"
	mklink "%%i" "%~dp0\%%i"
)
for /f "delims=" %%i in ('dir /b /a:-d ^| find "SC2Mod"') do (
	cd /d "C:\Program Files (x86)\StarCraft II\Mods"
	del "%%i"
	mklink /d "%%i" "%~dp0\%%i"
)
cd /d %~dp0\tstory01.SC2Map\Base.SC2Data\GameData
del /q ConversationStateData.xml
mklink /h ConversationStateData.xml "%~dp0\WoLTibEdition.SC2Mod\Base.SC2Data\GameData\ConversationStateData.xml"
cd /d %~dp0\tstory01.SC2Map\enUS.SC2Data\LocalizedData
del /q GameStrings.txt
mklink /h GameStrings.txt "%~dp0\WoLTibEdition.SC2Mod\enUS.SC2Data\LocalizedData\GameStrings.txt"
pause