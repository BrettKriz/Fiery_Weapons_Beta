@ECHO off
@SETLOCAL EnableDelayedExpansion
:: Define vars & data
SET SPC=]   
SET NAME=SW Updater
SET EXT=.swid
SET EXT2=.gma

SET YES=yes
SET NO=no
SET SWID_FOUND=%NO%
SET GMA_FOUND=%NO%

SET T_EXE="C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/bin/gmpublish.exe"
IF [%1]==[] (
	SET /a DUR=120
)
ELSE
(
	SET /a DUR=%1
)

:: Start run
TITLE ~ %NAME% ~ RUN INIT ~
COLOR 0F

ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO     %NAME%
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO %SPC%
ECHO %SPC%

TITLE ~ %NAME% ~ LOOKING FOR SWID ~
ECHO %SPC%Searching for Steam Workshop ID file (%EXT%)
ECHO %SPC%
::SET RAW_SWID = DIR /s/b *%EXT%
::FOR /r %%x IN (DIR /s/b *%EXT%) DO (
FOR /r %%A IN (*%EXT%) DO (
	SET "CUR=%%A"
	SET "FName=%%~nA"
	ECHO %SPC%Current:!CUR! !FName!
	
	if %SWID_FOUND% equ %YES% (
		TITLE ~ %NAME% ~ ERROR ~
		COLOR C0
		ECHO %SPC%
		ECHO %SPC%TOO MANY Steam Workshop IDs Found 
		ECHO %SPC%EXITING
		ECHO %SPC%
		TIMEOUT /T %DUR%
		EXIT /B 2
	)
	
	COLOR 0A
	SET "T_SWID=!FName!"
	SET "SWID_FOUND=%YES%"
	TITLE ~ %NAME% ~ FOUND SWID ~ !T_SWID! ~
	ECHO %SPC%Found SWID:!T_SWID!
)
IF %SWID_FOUND% equ %NO% (
		TITLE ~ %NAME% ~ ERROR ~
		COLOR C0
		ECHO %SPC%
		ECHO %SPC%ZERO Steam Workshop IDs Found 
		ECHO %SPC%EXITING
		ECHO %SPC%
		TIMEOUT /T %DUR%
		EXIT /B 2
)
ECHO %SPC%
ECHO %SPC%
TITLE ~ %NAME% ~ LOOKING FOR GMA ~
ECHO %SPC%Searching for GMA file (%EXT2%)
ECHO %SPC%
::SET RAW_SWID = DIR /s/b *%EXT%
::FOR /r %%x IN (DIR /s/b *%EXT%) DO (
FOR /r %%B IN (*%EXT2%) DO (
	SET "CUR=%%B"
	SET "FName=%%~nB"
	ECHO %SPC%Current:!CUR! !FName!
	
	if %GMA_FOUND% equ %YES% (
		TITLE ~ %NAME% ~ ERROR ~
		COLOR C0
		ECHO %SPC%
		ECHO %SPC%TOO MANY GMAs Found 
		ECHO %SPC%EXITING
		ECHO %SPC%
		TIMEOUT /T %DUR%
		EXIT /B 2
	)
	
	COLOR 0A
	SET "T_GMA=!CUR!"
	SET "GMA_FOUND=%YES%"
	TITLE ~ %NAME% ~ FOUND SWID ~ !T_GMA! ~
	ECHO %SPC%Found SWID:!T_GMA!
)
IF %GMA_FOUND% equ %NO% (
		TITLE ~ %NAME% ~ ERROR ~
		COLOR C0
		ECHO %SPC%
		ECHO %SPC%ZERO GMAs Found 
		ECHO %SPC%EXITING
		ECHO %SPC%
		TIMEOUT /T %DUR%
		EXIT /B 2
)
ECHO %SPC%
ECHO %SPC%
::TITLE ~ %NAME% ~ CHANGE DISC ~
COLOR 0E
ECHO.
ECHO.
SET /P CHANGES=Please enter the change log discription: 
COLOR 07
SET T_EXE_ARG=update -id %T_SWID% -addon "%T_GMA%" -changes "%CHANGES%"
ECHO %SPC%
ECHO %SPC%SWID: %T_SWID%
ECHO %SPC%Args: %T_EXE_ARG%
ECHO %SPC%About to request update.

:: Run the updater

( CALL %T_EXE% %T_EXE_ARG% ) 2>&1
IF %ERRORLEVEL% geq 1 (
	:: ERROR
	TITLE ~ %NAME% ~ ERROR ~
	COLOR C0
	
	ECHO %SPC%
	ECHO %SPC%ERROR WHILE RUNNING
	ECHO %SPC%SEE OUTPUT
	TIMEOUT /T %DUR%
	EXIT /B 1
)
TITLE ~ %NAME% ~ UPDATE OK ~
COLOR 0A

ECHO %SPC%
ECHO %SPC%
TIMEOUT /T %DUR%