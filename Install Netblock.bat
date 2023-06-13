@echo off
if exist "Reinstall Netblock.bat" goto Reinstall
echo Install...
if exist Netblock.zip tar -xf Netblock.zip
if exist %USERPROFILE%\AppData\LocalLow\Netblock rmdir /s /q %USERPROFILE%\AppData\LocalLow\Netblock
md %USERPROFILE%\AppData\LocalLow\Netblock
xcopy /q /y Netblock %USERPROFILE%\AppData\LocalLow\Netblock
if exist %USERPROFILE%\AppData\Roaming\Netblock rmdir /s /q %USERPROFILE%\AppData\Roaming\Netblock
md %USERPROFILE%\AppData\Roaming\Netblock
xcopy /q /y %USERPROFILE%\AppData\LocalLow\Netblock %USERPROFILE%\AppData\Roaming\Netblock
if exist Netblock.zip rmdir /s /q Netblock
copy "Instrukcja instalacji Netblock.txt" %USERPROFILE%\AppData\LocalLow\Netblock
if exist Netblock.zip del "Instrukcja instalacji Netblock.txt"
copy "Install Netblock.bat" "%USERPROFILE%\AppData\LocalLow\Netblock\Reinstall Netblock.bat"
if exist Netblock.zip del "Install Netblock.bat"
copy "Uninstall Netblock.bat" %USERPROFILE%\AppData\LocalLow\Netblock
if exist Netblock.zip del "Uninstall Netblock.bat"
copy "Open folder Netblock.bat" "%USERPROFILE%\AppData\LocalLow\Netblock\Checking files.bat"
copy %USERPROFILE%\AppData\LocalLow\Netblock\Start.vbs "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
(echo start=0)>%USERPROFILE%\AppData\LocalLow\Netblock\dane.vxv
(echo odx=23
echo ody=5)>%USERPROFILE%\AppData\LocalLow\Netblock\dane.x
echo Installations completed.
pause
(echo Pierwsze urchomienie)>%USERPROFILE%\AppData\LocalLow\Netblock\firstStart.txt
call %USERPROFILE%\AppData\LocalLow\Netblock\Config.bat
exit
:Reinstall
echo Reinstall...
xcopy /q /y %USERPROFILE%\AppData\Roaming\Netblock %USERPROFILE%\AppData\LocalLow\Netblock
echo Reinstallations completed.
pause
exit