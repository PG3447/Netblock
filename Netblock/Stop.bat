(echo ex=1)>>dane.x
if exist %USERPROFILE%\AppData\LocalLow\Netblock\Blokada.bat (
	(echo ex=1)>>"%USERPROFILE%\AppData\LocalLow\Netblock\dane.x"
	(echo start=0)>"%USERPROFILE%\AppData\LocalLow\Netblock\dane.vxv"
)
if exist stopconfig.txt (
	del "%USERPROFILE%\AppData\LocalLow\Netblock\stopconfig.txt"
	call "%USERPROFILE%\AppData\LocalLow\Netblock\Config.bat"
)