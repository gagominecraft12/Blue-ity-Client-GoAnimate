@echo off
title VFProxy Launcher
set PORT=8080
echo:
echo Welcome to the VFProxy launcher.
echo:
echo Would you like to host this on a different port?
echo:
echo If so, enter in your desired port number.
echo Otherwise, press Enter.
echo:
set /p PORT= Port: 
echo Running php.exe...
PING -n 3 127.0.0.1>nul
echo:
cd vfproxy
start "" "http://localhost:%PORT%/vfproxy/speech.php?voice=David&msg=Hello%20World!"
call ..\php\php.exe -S localhost:%PORT%