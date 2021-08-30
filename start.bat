:: Important stuff
@echo off && cls
title Blue'ity Client

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

:: Terminate existing node.js apps
TASKKILL /IM node.exe /F 2>nul
cls

:::::::::::::::::::::::::::::
:: Start Blue'ity Client ::
:::::::::::::::::::::::::::::

:: Check for installation

	

if exist notinstalled (
	echo Blue'ity Client not downloaded! Installing...
	call npm install
	ren "notinstalled" "installed"
	cls
	goto start
) else (
	goto start
)

:: Run npm start
:start
echo Blue'ity client is now starting...
echo Running VFProxy..

start tts\VFProxy\start.bat

echo Please navigate to http://localhost on your browser.
npm start
