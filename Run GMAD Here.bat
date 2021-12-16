@ECHO off
@SETLOCAL EnableDelayedExpansion
SET "SPC=]   "
SET TTL=~ GMAD - Create Addon File ~
TITLE %TTL%
COLOR 0A
REM ECHO START0
SET EXE="C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/bin/gmad.exe"
SET IN=%1
SET OUT_F=!IN:~0,-1!
REM ECHO START1 %IN% -- 
SET DUR=%2
REM ECHO START2 %DUR% --
IF [%2]==[] (
	SET /a DUR=120
)
REM ECHO START3
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO     %TTL%
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO %SPC% IN %IN% , DUR %DUR%
ECHO %SPC%
%EXE% create -folder %IN% -out %IN%
IF %ERRORLEVEL% geq 1 (
	:: ERROR
	TITLE %TTL% ERROR ~
	COLOR C0
	ECHO %SPC%
	ECHO %SPC%ERROR WHILE RUNNING GMAD
	ECHO %SPC%SEE OUTPUT
	::PAUSE
	TIMEOUT /T %DUR%
	EXIT /B 1
)
TITLE %TTL% RUN OK ~
ECHO %SPC%
ECHO %SPC%Moving %OUT_F%.gma
ECHO %SPC%to %IN%
ECHO %SPC%
MOVE /Y %OUT_F%.gma" %IN%
ECHO %SPC%
ECHO %SPC%
TITLE %TTL% DONE ~
COLOR A0
TIMEOUT /T %DUR%