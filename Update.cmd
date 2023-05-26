@echo off
for %%I in (.) do set CurrDirName=%%~nxI
del /s /q %CurrDirName%.zip
set zip="C:\Program Files\7-Zip\7z.exe"
%zip% a -mmt=8 -tzip %CurrDirName%.zip *.SC2Map *.SC2Mod metadata.txt
REM %zip% a -mmt=8 -tzip %CurrDirName%.zip 
REM %zip% a -mmt=8 -tzip %CurrDirName%.zip 
pause