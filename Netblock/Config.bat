@echo off
@chcp 65001
title konfiguracja Netblock
color 07
set mm=0
set yzy=7
rem Author PG3447

:SprawdzenieInstalacjiv1
set instalka=0
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Blokada.bat set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\dane.x set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Stop.bat set /a instalka+=1
if not exist %USERPROFILE%\AppData\LocalLow\Netblock\Start.vbs set /a instalka+=1
if "%instalka%"=="0" (
	set instalka=0
	goto StartMenu
)
if "%instalka%"=="4" (
	cls
	echo Program nie został zainstalowany.
	pause>nul
	set instalka=0
	exit
) else (
	cls
	echo Brakuje potrzebnych plików do prawidłowego działania programu.
	pause>nul
	set instalka=0
	goto StartMenu
)

:StartMenu
mode 120,16
cls
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo ========================================================================================================================
echo ========================================================================================================================
echo ========================================================================================================================
echo   ////////////////////////////////////         ° ___              ___ ___ ___  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo  ////////////////////////////////////   \    / ǀ  ǀ   /\   /\/\   \˅/ \˅/ \˅/   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo ////////////////////////////////////     \/\/  ǀ  ǀ  /¯¯\ /    \   ○   ○   ○     \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo ========================================================================================================================
echo ========================================================================================================================
echo ========================================================================================================================
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
ping localhost -n 2 >nul
:menu
mode 120,30
for /f "delims=*" %%a in (%USERPROFILE%\AppData\LocalLow\Netblock\dane.x) do (
	set %%a
)
for /f "delims=*" %%a in (%USERPROFILE%\AppData\LocalLow\Netblock\dane.vxv) do (
	set %%a
)
if exist %USERPROFILE%\AppData\LocalLow\Netblock\firstStart.txt if exist Netblock.zip del "Open folder Netblock.bat"
if exist %USERPROFILE%\AppData\LocalLow\Netblock\firstStart.txt (
	start %USERPROFILE%\AppData\LocalLow\Netblock
	del %USERPROFILE%\AppData\LocalLow\Netblock\firstStart.txt
)
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" set "Vbsuruchom=włączone"
if not exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" set "Vbsuruchom=wyłączone"
cls
echo Witam.
echo Wybierz:
if "%start%"=="0" echo 1. Włącz program Netblock
if "%start%"=="1" echo 1. Wyłącz program Netblcok (Należy zaczekać około 30s na wyłączenie) 
if "%start%"=="1" echo   (Potwierdzeniem prawidłowego wyłączenia programu jest plik PonowneLacznieZSiecia.txt, 
if "%start%"=="1" echo    który na kilka sekund przed wyłączeniem programu pojawi się na pulipicie)
echo 2. Ustaw godziny odłączonego internetu (Domyślnie od 23 do 5) (Aktualnie od %odx% do %ody%)
echo 3. Ustawianie automatycznego uruchamiania programu Netblock podczas uruchamiania systemu (Aktualnie %Vbsuruchom%)
echo 4. Przywróć ustawienia fabryczne
echo 5. Ustawienia kolorystyki
echo 6. Wyjdź
set /p "menu=>>"
if "%menu%"=="1" goto uruchamianiaProgramu
if "%menu%"=="2" goto start
if "%menu%"=="3" goto AutoProgram 
if "%menu%"=="4" goto FabrykaDaje
if "%menu%"=="5" goto optionx
if "%menu%"=="6" exit
goto menu


:optionx
cls 
echo A.Wybierz kolor tła     
echo B.Wybierz kolor liter
echo C.Powrót do menu
choice /c:abc /n
if ERRORLEVEL 3 goto menu
if ERRORLEVEL 2 goto olitery
if ERRORLEVEL 1 goto okolor


:okolor
cls
color %mm%%yzy%
echo A.Wybierz kolor tła:
echo 1. Zielony
echo 2. Jasno niebieski
echo 3. Czerwony
echo 4. Czarny
echo 5. Żółty
echo 6. Powrót
echo B.Wybierz kolor liter:
echo C.Powrót do menu
choice /c:123456bc /n

if ERRORLEVEL 8 goto menu

if ERRORLEVEL 7 goto olitery

if ERRORLEVEL 6 goto optionx

if ERRORLEVEL 5 set mm=6&goto okolor

if ERRORLEVEL 4 set mm=0&goto okolor

if ERRORLEVEL 3 set mm=4&goto okolor

if ERRORLEVEL 2 set mm=B&goto okolor

if ERRORLEVEL 1 set mm=A&goto okolor
goto okolor


:olitery
cls
color %mm%%yzy%
echo A.Wybierz kolor tła:
echo B.Wybierz kolor liter:
echo 1. Czarny 
echo 2. Czerwony
echo 3. Niebieski
echo 4. Biały
echo 5. Zielony
echo 6. Żółty
echo 7. Powrót
echo C.Powrót do menu
choice /c:a1234567c /n

if ERRORLEVEL 9 goto menu

if ERRORLEVEL 8 goto optionx

if ERRORLEVEL 7 set yzy=6&goto olitery

if ERRORLEVEL 6 set yzy=A&goto olitery

if ERRORLEVEL 5 set yzy=7&goto olitery

if ERRORLEVEL 4 set yzy=1&goto olitery

if ERRORLEVEL 3 set yzy=4&goto olitery

if ERRORLEVEL 2 set yzy=0&goto olitery

if ERRORLEVEL 1 goto okolor
goto olitery


:FabrykaDaje
color 07
cls
if exist %USERPROFILE%\AppData\LocalLow\Netblock if not "%cd%"=="%USERPROFILE%\AppData\LocalLow\Netblock" cd %USERPROFILE%\AppData\LocalLow\Netblock
if exist %USERPROFILE%\AppData\LocalLow\Netblock\Blokada.bat (
	(echo odx=23
	echo ody=5)>"%USERPROFILE%\AppData\LocalLow\Netblock\dane.x"
) else (
cls
echo Program nie został zainstalowany
pause>nul
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  :( No weź zainstaluj go :/  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ping localhost -n 1 >nul
goto menu
)
goto FabrykaPrzelacza
:FabrykaPrzelacza
if not exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" (
	if exist Start.vbs copy Start.vbs "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
	if not exist Start.vbs (
		cls
		echo Brak pliku "Start.vbs" w folderze "Netblock" do przywrócenia ustawieni fabrycznych.
		echo Należy skopiować "Start.vbs" z paczki instalacjnej "Netblock.zip" do folderu "Netblock", 
		echo który powinien znajdować się "%USERPROFILE%\AppData\LocalLow\Netblock".
		echo.
		pause>nul
		goto menu
	)
)
goto menu


:uruchamianiaProgramu
if not "%cd%"=="%USERPROFILE%\AppData\LocalLow\Netblock" cd %USERPROFILE%\AppData\LocalLow\Netblock
cls
if "%start%"=="0" (
	if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" (
		call "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs"
	) else if exist "%USERPROFILE%\AppData\LocalLow\Netblock\Start.vbs" (
		call "%USERPROFILE%\AppData\LocalLow\Netblock\Start.vbs"
	) else (
		cls
		echo Brak pliku uruchamiającego Start.vbs
		pause>nul
	)
)
if "%start%"=="1" (
	(echo Przejdzi do konfiguracj)>"%USERPROFILE%\AppData\LocalLow\Netblock\stopconfig.txt"
	call "%USERPROFILE%\AppData\LocalLow\Netblock\Stop.bat"
)
goto menu


:AutoProgram
if exist %USERPROFILE%\AppData\LocalLow\Netblock if not "%cd%"=="%USERPROFILE%\AppData\LocalLow\Netblock" cd %USERPROFILE%\AppData\LocalLow\Netblock\
cls
echo Domyślnie włączone.
echo Wybierz:
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs"     echo 1. Wyłącz automatyczne urchamianie programu Netblock razem z systemem
if not exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" echo 1. Włącz automatyczne urchamianie programu Netblcok razem z systemem
echo 2. Powrót
set /p "aut=>>"
if "%aut%"=="1" goto Przelacz
if "%aut%"=="2" goto menu


:Przelacz
cls
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs"&goto AutoProgram
if not exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Start.vbs" goto KopiowanieVBS
goto AutoProgram


:KopiowanieVBS
cls
if exist Start.vbs copy Start.vbs "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if not exist Start.vbs goto BladPliku
goto AutoProgram


:BladPliku
cls
echo Błąd
echo Brak pliku "Start.vbs" w folderze "Netblock". 
echo Należy skopiować "Start.vbs" z paczki instalacjnej "Netblock.zip" do folderu "Netblock", 
echo który powinien znajdować się "%USERPROFILE%\AppData\LocalLow\Netblock".
echo.
echo Aby powrócić wciśnij dowolny klawisz.
pause>nul
goto AutoProgram


:start
cls
echo Ustaw czas, w którym internet będzie odłączony.
echo.
echo.
echo.
echo Wciśnij dowolny przycisk, aby przejści dalej.
pause>nul
goto ZapisDanych

:zle
cls
echo Format godziny został źle podany.
echo.
echo Wciśnij dowolny przycisk, aby powrócić.
pause>nul
goto ZapisDanych


:Cofacz
cls
echo Taki format nie istnieje no sory. Mniej niż zero nie zostanie ustawione.
echo.                  \   ___   / 
echo.                   \_/._.\_/
echo.                     \/ \/
echo Ustawione godziny od %odx% do %ody%
echo Format godzin został źle ustawiony.
pause>nul
goto ZapisDanych

:CzlowiekZSaturna
cls
echo Format godzin został przekroczony.
echo Ustawione godziny od %odx% do %ody%   o_0
echo Przypomnienie na ziemi doba trwa tylko 24h. 
echo.
pause>nul
goto ZapisDanych


:ZapisDanych
set ok=0
if exist %USERPROFILE%\AppData\LocalLow\Netblock if not "%cd%"=="%USERPROFILE%\AppData\LocalLow\Netblock" cd %USERPROFILE%\AppData\LocalLow\Netblock\
for /f "delims=*" %%a in (dane.x) do (
	set %%a
)
cls
echo Podaj godziny, w których internet będzie odłączony. (Domyślnie od 23 do 5)
echo Aktualnie jest ustawione od godziny %odx% do godziny %ody%.
echo.
echo Godziny od 00-9 należy podać w formacie : 0,1,2,3...8,9.
echo.
set /p "odx=Od: "
set /p "ody=Do: "

if %odx% LSS 0 goto Cofacz
if %ody% LSS 0 goto Cofacz

if %odx% GTR 24 goto CzlowiekZSaturna
if %ody% GTR 24 goto CzlowiekZSaturna


for /l %%a in (0,1,9) do (
	if "%odx%" LSS "10" if "%%a"=="%odx%" set ok=1
)
if "%odx%" LSS "10" if "%ok%"=="0" goto zle

for /l %%a in (0,1,9) do (
	if "%ody%" LSS "10" if "%%a"=="%ody%" set ok=1
)
if "%ody%" LSS "10" if "%ok%"=="0" goto zle
if %odx% LSS 10 set "odx= %odx%"
if %ody% LSS 10 set "ody= %ody%"

if "%odx%"=="24" set "odx=0"
if "%ody%"=="24" set "ody=0"

(echo odx=%odx%
echo ody=%ody%)>"%USERPROFILE%\AppData\LocalLow\Netblock\dane.x"


:Potwierdzenie
cls
echo Czas został ustawiony: %odx% - %ody%
echo.
echo.
echo Wciśnij dowolny przycisk, aby zakoniczyć konfiguracjie godzin.
pause>nul
goto menu


