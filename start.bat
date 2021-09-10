:start
:: Clean spam
@echo off && cls
title boyfreind maker fnf
@echo off && cls
echo off

:::::::::::::::
::   Things  ::
:::::::::::::::

SETLOCAL ENABLEDELAYEDEXPANSION

@echo off && cls

pushd "%~dp0"


@echo off && cls

title Running Blue'ity Client

ping -n 5 127.0.0.1>nul

:: Important stuff
@echo off && cls
title Blue'ity Client - (Starting)

:::::::::::::::::::
:: LOADING FILES ::
:::::::::::::::::::
title Blue'ity Client - (Loading Files)
ping -n 3 127.0.0.1>nul
echo Loading files (May take few minutes/hours or seconds i think LOL)
assoc
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

:: Terminate existing node.js apps
echo gonna terminate the existing node js apps. so lets get a delay

ping -n 3 127.0.0.1>nul

title Blue'ity Client b0.1.1 (Terminating Existing node apps.)

ping -n 1 127.0.0.1>nul

taskkill /IM node.exe /F

@echo off && cls

:::::::::::::::::::::::::::::
::  Start Blue'ity Client  ::
:::::::::::::::::::::::::::::

:: Check for installation
ping -n 4 127.0.0.1>nul
@echo GOING TO CHECK FOR SOMETHING.
ren "initialWrapper" "initialFileWrapper" "CandyWrapper"
call assoc
cls & assoc
assoc
@echo off && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: no black people allowed :)

@echo working on files..

@echo off && cls

:start
	title Blue'ity Client (Checking)

if exist notinstalled (
	echo Blue'ity Client not downloaded! Installing...
	call npm install
	ren "notinstalled.txt" "installed.txt"
	cls
	goto start
) else (
	goto start
)

::VFProxy installation
:start

title Blue'ity Client - (Installing VFProxy)

echo we need to run the VFProxy

echo Dont worry. we need to delay this batch before we wait to install VFProxy

ping -n 2 127.0.0.1>nul

start startVFProxy.bat
ping -n 2 127.0.0.1>nul
echo Starting.

ping -n 3 127.0.0.1>nul

title Blue'ity Client

@echo Lets clear to make it more good
cls
ping -n 5 127.0.0.1>nul

echo off

@echo off && cls

:: Starting Ungoogled Chromiun
:start
title Blue'ity Client - Starting ungoogled Chromiun.

ping -n 4 127.0.0.1>nul
echo Starting Ungoogled Chromiun

echo not gonna simp for monika lol

start .\browser\Ungoogled-Chromiun\chrome.exe --allow-outdated-plug-ins --app=http://localhost:1200/html/list.html

cls
@echo off && cls

:: Run npm start
:start
echo Blue'ity client is now starting...

echo Please navigate to http://localhost:1200 on your browser.
ping -n 10 127.0.0.1>nul
npm start

echo Ow. beep :(
		echo Blue'ity Client crashed. this does that the main or assets is glitched.
		cls
		echo Restart the project with starting the batch restart.bat file.
		ping -n 4 127.0.0.1>nul
		Pause