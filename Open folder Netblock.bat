@echo off
@chcp 65001
if exist "Checking files.bat" goto check
if exist %USERPROFILE%\AppData\LocalLow\Netblock start %USERPROFILE%\AppData\LocalLow\Netblock
if not exist %USERPROFILE%\AppData\LocalLow\Netblock (
	cls
	echo Program Netblock nie został zainstalowny lub folder z danymi został usunięty.
	echo.
	pause
)
exit


:check
cls
set "good=0"
if exist "Awaryjne podłączenie interntu z powrotem.bat" set /a good+=1
if exist "Blokada.bat" set /a good+=1
if exist "Config.bat" set /a good+=1
if exist "dane.x" set /a good+=1
if exist "instrukcjaV1.txt" set /a good+=1
if exist "Start.vbs" set /a good+=1
if exist "Stop.bat" set /a good+=1


if "%good%"=="7" (
	cls
	echo Jest ok: 100%
	pause
	exit
)
cls
set /a procent=%good%*100/7
echo Jest ok: %procent% procent
if "%procent%" LSS "50" goto reinstal
echo Wybierz:
echo 1. Przeinstaluj program
echo 2. Wyjdź
set /p "ren=>>"
if "%ren%"=="1" call "Reinstall Netblock.bat"
if "%ren%"=="2" exit
exit

:reinstal
cls
echo Jest ok: %procent% procent
echo Propnuje zrobić reinstalacje programu.
echo.
echo Czy chcesz zreinstlować program? Tak/Nie
set /p "odp=>>"
if /i "%odp%"=="tak" call "Reinstall Netblock.bat"
if /i "%odp%"=="t" call "Reinstall Netblock.bat"
if /i "%odp%"=="yes" call "Reinstall Netblock.bat"
if /i "%odp%"=="y" call "Reinstall Netblock.bat"
if /i "%odp%"=="nie" exit
if /i "%odp%"=="n" exit
if /i "%odp%"=="no" exit
