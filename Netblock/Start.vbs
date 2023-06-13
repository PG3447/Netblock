Set objWShell = WScript.CreateObject("WScript.Shell")
Dim appData
appData = objWShell.expandEnvironmentStrings("%USERPROFILE%")

Set objShell = CreateObject( "WScript.Shell" )

' Zmiana lokalizacji pracy programu

objShell.CurrentDirectory = appData+"\AppData\LocalLow\Netblock"

CreateObject("Wscript.Shell").Run "%USERPROFILE%\AppData\LocalLow\Netblock\Blokada.bat",0,False

Set FSO = CreateObject("Scripting.FileSystemObject")

Set File = FSO.CreateTextFile(appData+"\AppData\LocalLow\Netblock\dane.vxv",True)
File.Write "start=1"
File.Close