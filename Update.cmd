@echo off
for %%I in (.) do set CurrDirName=%%~nxI
del /s /q %CurrDirName%.zip
set zip="C:\Program Files\7-Zip\7z.exe"
%zip% a -mmt=8 -tzip %CurrDirName%.zip *.SC2Map
%zip% a -mmt=8 -tzip %CurrDirName%.zip *.SC2Mod
%zip% a -mmt=8 -tzip %CurrDirName%.zip metadata.txt
pause