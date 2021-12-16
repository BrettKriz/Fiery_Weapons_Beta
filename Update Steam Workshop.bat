@echo off
@SETLOCAL EnableDelayedExpansion
SET /a DUR=1
SET /a DUR2=120

SET "SPC=]   "
SET LOGPATH=Log_SWID_Missing.txt
SET LOGPATH2=Log_GMAD_Issues.txt
SET YES=yes
SET NO=no
SET doGMAD=%NO%
SET doUpdate=%YES%
ECHO %LOGPATH2% > %LOGPATH2%
ECHO %LOGPATH% > %LOGPATH%
SET SKIPUPDATE=true
ECHO https://steamcommunity.com/sharedfiles/filedetails/?id=
TITLE About to update all...
COLOR 07
CLS
ECHO %SPC%

SET GMAD="Run GMAD Here.bat"
::SET GMPUB = "C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/bin/gmpublish.exe"
SET GMPUB="../Updater Script.bat"
::SET BASE_P="C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/garrysmod/addons/"

::SET /P CHANGE_STR = "Write a brief change log: "
COLOR 0F
ECHO %SPC%
SET count=1 
ECHO %SPC%
ECHO %SPC%
ECHO %SPC% About to update...
ECHO %SPC%
DIR /A:D /B
ECHO %SPC%
ECHO %SPC% Now lets use the loop:
ECHO %SPC%

FOR /r %%A IN ('DIR /A:D /B') DO (
	ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	ECHO.
	ECHO.
	ECHO.	
	ECHO.
	ECHO.
	ECHO "%%A"
	ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	COLOR 0B
	ECHO %SPC%
	
	SET WHERE = %%A
	
	ECHO %SPC%
	ECHO %SPC%WHERE: "%%A"
	TITLE # !count! - "%%A"
	ECHO %SPC%# !count! - "%%A"
	IF %doGMAD% equ %YES% (
		ECHO %SPC%REBUILDING .GMA Files...
		TITLE !count! - "!cd!" - "%%A" - %GMAD% - REBUILDING .GMA Files...
		ECHO %SPC%%GMAD%
		( CALL %GMAD% "%%A" %DUR% ) 2>&1
		IF !ERRORLEVEL! geq 1 (
			COLOR C0
			TITLE ~ BASE ERROR ~
			ECHO %SPC%
			ECHO %SPC%Unable to create new GMA, moving forward with current if it exists
			ECHO %SPC%
			ECHO %%A >> %LOGPATH2%
			TIMEOUT /T %DUR%
		) ELSE (
			COLOR 0A
			ECHO %SPC%
			ECHO %SPC%%ERRORLEVEL%
			ECHO %SPC%OK 1
		)
	)
	COLOR 0F
	CD "%%A"
	ECHO %SPC%
	ECHO %SPC%
	REM TIMEOUT /T !DUR2!
	
	ECHO %SPC%UPDATING STEAM WORKSHOP...
	ECHO %SPC%
	IF %doUpdate% equ %YES% (
		ECHO %SPC%WHERE: "%%A"
		TITLE !count! - "!cd!" - "%%A" - UPDATING STEAM WORKSHOP...
		
			( CALL %GMPUB% %DUR% ) 2>&1
		IF !ERRORLEVEL! geq 1 (
			COLOR C0
			TITLE ~ BASE ERROR ~
			ECHO %SPC%
			ECHO %SPC%Unable to update STEAM WORKSHOP
			ECHO %SPC%
			ECHO %cd% >> %LOGPATH%
			TIMEOUT /T %DUR%
		) ELSE (
			COLOR 0A
			ECHO %SPC%
			ECHO %SPC%%ERRORLEVEL%
			ECHO %SPC%OK 2
		)
	)
	COLOR 0F
	ECHO %SPC%
	
	set /a count+=1
	
	ECHO %SPC%Returing to level up...
	CD ..
	ECHO %SPC%
	ECHO.
	
	TIMEOUT /T %DUR%
)
TITLE DONE MAIN
ECHO %SPC%
COLOR 0A
::TIMEOUT /T %DUR2%
PAUSE
ECHO %SPC%
EXIT /B 0