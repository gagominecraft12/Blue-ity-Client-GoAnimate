:start
:: Clean spam
@echo off && cls
title boyfreind maker fnf
title Blue'ity Client - REMINDER
echo To say. I DO NOT OWN VYOND'S ASSETS
ping -n 4 127.0.0.1>nul
cls
title Blue'ity Client - Credits
cls
echo Credits to Vyond - Official Assets
ping -n 2 127.0.0.1>nul
echo Credits to 2Epik4u - Wrapper Online Videomaker
ping -n 4 127.0.0.1>nul
echo Credits to Imageny - Creator of VFProxy
ping -n 2 127.0.0.1>nul
echo Credits to Eloston - Creator of Ungoogled Chromiun
ping -n 2 127.0.0.1>nul
echo Credits to Alvin Hung - Creator of Business themes and Vyond
ping -n 3 127.0.0.1>nul
@echo off && cls
echo off

:::::::::::::::
::   Things  ::
:::::::::::::::

SETLOCAL ENABLEDELAYEDEXPANSION

::if ("CREATORSUPDATE", deny)
::notinstalled.txt
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
cls
echo gonna terminate the existing node js apps. so lets get a delay

ping -n 3 127.0.0.1>nul

title Blue'ity Client - (Terminating Existing node apps.)

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
ping -n 4 127.0.0.1>nul
npm start

echo Ow. beep :(
echo Blue'ity Client crashed. this does that the main or assets is glitched.
echo Restart the project with starting the batch restart.bat file.
ping -n 4 127.0.0.1>nul
Pause