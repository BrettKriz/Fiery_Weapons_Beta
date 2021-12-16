@ECHO off
@SETLOCAL EnableDelayedExpansion
:: Define vars & data
SET STEAM_PATH=<REDACTED>

SET "SPC=]   "
SET NAME=SWID Resolver
SET EXT=.swid
SET EXT2=.gma

SET YES=yes
SET NO=no
SET SWID_FOUND=%NO%

SET IN=%1
SET OUT_F=!IN:~0,-1!
SET "TARGET=Log_SWID_Missing.txt"
:: Start run
TITLE ~ %NAME% ~ RUN INIT ~
COLOR 07

ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO     %NAME%
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO %SPC%
ECHO %SPC%
REM EXPLORER "https://steamcommunity.com/id/%STEAM_PATH%/myworkshopfiles/"
TITLE ~ %NAME% ~ Waiting for Web Browser . . . ~
ECHO %SPC%Waiting for Web Browser . . .
ECHO %SPC%
TIMEOUT /T 5
ECHO %SPC%
ECHO %SPC%
REM dir "Log_SWID_Missing.txt" /s /b
REM ' DIR /s /b /p /a:d "%TARGET%" '
FOR /r %%A IN ( *%TARGET% ) DO (
	COLOR 0F
	SET "CUR=%%~dpA"
	:: https://steamcommunity.com/sharedfiles/filedetails/?id=2124083142
	ECHO %SPC%Changing Directory . . .
	CD "!CUR!"
	ECHO %SPC%
	TITLE ~ %NAME% ~ !CUR! ~
	ECHO %SPC% %EXT2% Check:
	DIR *%EXT2% /b

	ECHO %SPC%
	ECHO %SPC%Current: !CD!
	ECHO %SPC%
	ECHO %SPC%
	REM FName
	
	SET "IN_SWID="
	ECHO %SPC% !IN_SWID!
	COLOR 0E

	ECHO %SPC% Dont enter anything to skip this entry
	SET /P "IN_SWID=%SPC%Please find the SWID for !FName! and enter its SWID: "
	
	SET "IN_SWID=!IN_SWID:https://steamcommunity.com/sharedfiles/filedetails/?id=!"
	SET IN_SWID=!IN_SWID:~1!
	
	ECHO %SPC%!IN_SWID!
	ECHO %SPC%
	IF [%IN_SWID%]==[] (
		COLOR 0A
		SET "T_SWID=!IN_SWID!"
		SET "SWID_FOUND=%YES%"
		TITLE ~ %NAME% ~ FOUND SWID ~ !T_SWID! ~
		ECHO %SPC%Found SWID:!T_SWID!
		ECHO %SPC%
		ECHO %SPC%Writing file !T_SWID!%EXT%
		ECHO !T_SWID!>!T_SWID!%EXT%
		IF %ERRORLEVEL% geq 1 (
			:: ERROR
			TITLE ~ %NAME% ~ ERROR ~
			COLOR C0
			
			ECHO %SPC%
			ECHO %SPC%ERROR WHILE WRITING FILE
			ECHO %SPC%SEE OUTPUT
		) ELSE (
			COLOR 0A
			DEL /S "%TARGET%"
		)
	) ELSE (
		COLOR 0B
		TITLE ~ %NAME% ~ CANCELED ~
		ECHO %SPC%Skipping. . .
	)
	
	TIMEOUT /T 2
)
ECHO %SPC%
ECHO %SPC%
TITLE ~ %NAME% ~ RUN OK ~
COLOR 0A
ECHO %SPC% RUN DONE
ECHO %SPC%
TIMEOUT /T 240
CMD