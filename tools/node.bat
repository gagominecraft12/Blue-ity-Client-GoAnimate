:: Disables spam
@echo off && cls

set IDLE=Node started!
set IDLE2=Starting Node
title Blue'ity Client - %IDLE2%

echo Starting..
ping -n 4 127.0.0.1>nul
title Blue'ity Client - %IDLE%
pushd "%~dp0"
npm start