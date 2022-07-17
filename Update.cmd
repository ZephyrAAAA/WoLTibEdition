@echo off
del /s /q WoLTib.zip
set zip="C:\Program Files\7-Zip\7z.exe"
%zip% a -tzip WoLTib.zip *.SC2Map
%zip% a -tzip WoLTib.zip WoLTibEdition.SC2Mod
%zip% a -tzip WoLTib.zip metadata.txt
pause