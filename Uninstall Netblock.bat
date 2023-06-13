@echo off
echo Uninstall...
if "%cd%"=="%USERPROFILE%\AppData\LocalLow\Netblock" if exist "%USERPROFILE%\AppData\LocalLow\Netblock\Uninstall Netblock.bat" (
	cd %USERPROFILE%\AppData\LocalLow
	call "%USERPROFILE%\AppData\LocalLow\Netblock\Uninstall Netblock.bat"
	cls
	echo Uninstall completed.
	pause
	exit
)
@if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs"
@if exist %USERPROFILE%\AppData\Roaming\Netblock rmdir /s /q %USERPROFILE%\AppData\Roaming\Netblock
@if exist %USERPROFILE%\AppData\LocalLow\Netblock rmdir /s /q %USERPROFILE%\AppData\LocalLow\Netblock
@echo Uninstall completed.
@pause
@exit