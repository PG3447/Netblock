@echo off
@chcp 1250
setlocal enabledelayedexpansion
title blokada neta
rem Author PG3447

:SprawdzenieInstalacjiv1
set instalka=0
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Blokada.bat set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\dane.x set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Stop.bat set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Start.vbs set /a instalka+=1
if "%instalka%"=="0" (
	set instalka=0
	goto wczytywanie
)
if "%instalka%"=="4" (
	cls
	echo Program nie zostal zainstalowany.
	pause>nul
	set instalka=0
	exit
) else (
	cls
	echo Brakuje potrzebnych plikow do prawidlowego dzialania programu.
	pause>nul
	set instalka=0
	goto wczytywanie
)

:wczytywanie
for /f "delims=*" %%a in (%USERPROFILE%\AppData\LocalLow\Netblock\dane.x) do (
	set %%a
)


cls
set "x=0"
set "y=0"
set "ex=0"


:odliczanie
for /f "delims=*" %%a in (%USERPROFILE%\AppData\LocalLow\Netblock\dane.x) do (
	set %%a
)
if "%ex%"=="1" (
	(echo odx=%odx%
	echo ody=%ody%)>dane.x
	if "%x%"=="0" if "%y%"=="0" set ex=0&goto odliczanie
	(echo Wylaczanie)>TrwaPonowneLaczenieZSiecia.txt
	(echo Wylaczanie)>%USERPROFILE%\Desktop\TrwaPonowneLaczenieZSiecia.txt
	ipconfig /renew
	ping localhost -n 2 >nul
	ping localhost -n 2 >nul
	del TrwaPonowneLaczenieZSiecia.txt,
	del %USERPROFILE%\Desktop\TrwaPonowneLaczenieZSiecia.txt
	exit
)
echo !time!
	rem od 20 < do 5
	if %odx% LSS %ody% (
		rem 	if ( 16 > od 20 ) if ( 16 < do 5) odlacz
		if %time:~0,2% GTR %odx% if %time:~0,2% LSS %ody% goto odlacz
		
		rem 	if ( 16 <= od 20   ) zalacz
		if %time:~0,2% LEQ %odx% goto zalacz
		rem 	if ( 16 >= do 5   ) zalacz
		if %time:~0,2% GEQ %ody% goto zalacz
		
	) else (
		rem od 20 >= do 5
	
		rem		if ( 16 <= od 20 ) if ( 16 >= do 5) zalacz
		if %time:~0,2% LEQ %odx% if %time:~0,2% GEQ %ody% goto zalacz
		
		rem 	if ( 16 > od 20) odlacz 
		if %time:~0,2% GTR  %odx% goto odlacz
		rem		if ( 16 < do 5) odlacz
		if %time:~0,2% LSS %ody% goto odlacz
	)
	rem  Mniejsze lub równe <= LEQ  
	rem  Większe lub równe >= GEQ
	ping localhost -n 15 >nul
goto odliczanie

:odlacz
if "%x%"=="0" (
	set "y=0"
	set "x=1"
	ipconfig /release
)
ping localhost -n 5 >nul
cls
goto odliczanie


:zalacz
if "%y%"=="0" (
	set "x=0"
	set "y=1"
	ipconfig /renew
)
ping localhost -n 5 >nul
cls
goto odliczanie

exit