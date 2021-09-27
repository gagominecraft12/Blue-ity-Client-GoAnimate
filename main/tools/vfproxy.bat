@echo off && cls
pushd "%~dp0"
title Blue'ity Client - (Starting VFProxy)
pushd ..\VFProxy\
echo Starting PHP server for VFProxy...
.\php\php.exe -S 127.0.0.1:8181
echo VFProxy Started!
title Blue'ity Client 
echo:
echo:
pause & exit