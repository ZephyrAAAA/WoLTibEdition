@echo off
for %%I in (.) do set CurrDirName=%%~nxI
del /s /q %CurrDirName%.zip
powershell Compress-Archive -Path ^"*.SC2Map,*.SC2Mod,metadata.txt^"  -DestinationPath %CurrDirName%.zip
pause