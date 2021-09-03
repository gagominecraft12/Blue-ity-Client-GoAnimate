@echo off
echo off
title Blue'ity Client b0.1.1 (Restarting the Client)

TIMEOUT /T 4

TASKKILL /T start.bat

echo Restarting Blue'ity Client

title Blue'ity Client b0.1.1 (Starting)

start start.bat

title Blue'ity Client b0.1.1 (Done!)

echo Done!
pause

