@echo off && cls
pushd "%~dp0"
title Blue'ity Client - (Starting VFProxy)
pushd ..\VFProxy\
echo Starting PHP server for VFProxy...
start start.bat
echo VFProxy Started!
echo Blue'ity Client 
echo:
echo:
pause & exit