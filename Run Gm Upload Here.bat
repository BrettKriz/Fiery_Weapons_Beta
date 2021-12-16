@echo off
@SETLOCAL EnableDelayedExpansion
title Gmod Upload
color 0A
SET IN1=%1
SET IN2=%2
SET EXT=.swid
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo     .GMA Upload @ %IN_CLEAN%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
SET JPG_T=%IN2%
SET GMA_T=%IN1%
echo.
SET ARGS=create -addon %GMA_T% -icon %JPG_T%
ECHO %GMA_T% > %GMA_T%.%EXT%
echo.
echo.
echo.
echo Args are %ARGS%
echo.
echo.
echo.
"C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/bin/gmpublish.exe" %ARGS%
echo.
TIMEOUT /T 120